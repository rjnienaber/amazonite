module Amazonite::Codegen::Service
  class Utils
    def self.verify_keys(known_keys, json : JSON::Any)
      hash = json.as_h?
      return if hash.nil?

      unknown_keys = (hash.keys - known_keys).join("\", \"")
      raise Exception.new("unknown keys: \"#{unknown_keys}\"") unless unknown_keys.empty?
    end

    def self.snake_case_name(name)
      name.scan(/[A-Z]+[a-z]*/).map(&.[0].downcase).join("_")
    end
  end
end
