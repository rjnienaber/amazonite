private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum FunctionVersionLatestPublished
    LatestPublished

    def self.to_json(e : FunctionVersionLatestPublished, json : JSON::Builder) : Nil
      value = case e
              when AL::FunctionVersionLatestPublished::LatestPublished then "LATEST_PUBLISHED"
              else
                raise Exception.new("unknown enum value for 'FunctionVersionLatestPublished' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::FunctionVersionLatestPublished
      value = pull.read_string
      case value
      when "LATEST_PUBLISHED" then AL::FunctionVersionLatestPublished::LatestPublished
      else
        raise Exception.new("unknown enum value for 'FunctionVersionLatestPublished' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::FunctionVersionLatestPublished::LatestPublished then "LATEST_PUBLISHED"
      else
        raise Exception.new("unknown enum value for 'FunctionVersionLatestPublished' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::FunctionVersionLatestPublished?
      case key
      when "LATEST_PUBLISHED" then AL::FunctionVersionLatestPublished::LatestPublished
      else
        nil
      end
    end
  end
end
