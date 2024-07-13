require 'mail'

class Snapshot < ApplicationRecord
  serialize :data, coder: JSON
  class << self
    def take
      connection = Postmark::ApiClient.new(Rails.application.config.x.postmark.api_token)

      # See usage docs at https://github.com/wildbit/postmark-gem
      messages = connection.get_messages()
      data = parse_postmark_messages(messages)

      Snapshot.new(data: data)
    end

    def extract_address(address_string)
      Mail::Address.new(address_string).display_name
    end

    def parse_postmark_messages(messages = [])
      unformatted_data = { nodes: [], connections: {} }

      # using in_groups_of(group size, false to prevents padding the groups with nil if the array size is not a multiple of the group size.) function to avoid bottle necks if the messages collection is too big, find_each iterates in batches of 5000
      messages.in_groups_of(1000, false) do |group|
        group.each do |message|
          from = message[:from].split("<")[0].gsub("\"", "")
          subject = message[:subject].gsub("Re: ", "")
          unformatted_data[:nodes] << { id: from } unless unformatted_data[:nodes].include?({ id: from })

          message[:to].each do |recipient|
            name = recipient["Name"]
            if unformatted_data[:connections]["#{from}-#{name}"]
              unformatted_data[:connections]["#{from}-#{name}"][:topics] << subject unless unformatted_data[:connections]["#{from}-#{name}"][:topics].include?(subject)
            else
              unformatted_data[:nodes] << { id: name } unless unformatted_data[:nodes].include?({ id: name })
              unformatted_data[:connections]["#{from}-#{name}"] = { source: from, target: name, topics: [ subject] }
            end
          end
        end
      end

      #Creating the Snapshot data  for a propery work
      data = {}
      data[:nodes] = unformatted_data[:nodes]
      data[:links] = unformatted_data[:connections].values.map do |link|
        {source: link[:source], target: link[:target], topics: link[:topics].join(" and ")}
      end

      return data
    end
  end
end
