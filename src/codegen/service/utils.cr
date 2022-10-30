module Amazonite::Codegen::Service
  class Utils
    def self.verify_keys(known_keys, json : JSON::Any)
      hash = json.as_h?
      return if hash.nil?

      unknown_keys = (hash.keys - known_keys).join("\", \"")
      raise Exception.new("unknown keys: \"#{unknown_keys}\"") unless unknown_keys.empty?
    end

    def self.snake_case_name(name)
      name.split(/([A-Z][a-z]+)/).reject { |v| v == "" }.map(&.downcase).join("_")
    end

    def self.pascal_case(name) : String
      name
        # get rid of non-character values
        .split(/[-:\._\/ ]/)
        # split up words on pascal that are pascal already
        # sometimes a string value will have mixed case so do this so all words
        # are treated the same later on
        .flat_map(&.split(/([A-Z][a-z]+)/)).reject { |v| v == "" }
        # should just have words at this point, convert them all to Pascal case
        .map { |v| v[0].upcase + v[1..].downcase }.join
    end
  end
end
