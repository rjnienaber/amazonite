private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum PutMode
    Merge
    Overwrite

    def self.to_json(e : PutMode, json : JSON::Builder) : Nil
      value = case e
              when AAG::PutMode::Merge     then "merge"
              when AAG::PutMode::Overwrite then "overwrite"
              else
                raise Exception.new("unknown enum value for 'PutMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::PutMode
      value = pull.read_string
      case value
      when "merge"     then AAG::PutMode::Merge
      when "overwrite" then AAG::PutMode::Overwrite
      else
        raise Exception.new("unknown enum value for 'PutMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::PutMode::Merge     then "merge"
      when AAG::PutMode::Overwrite then "overwrite"
      else
        raise Exception.new("unknown enum value for 'PutMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::PutMode?
      case key
      when "merge"     then AAG::PutMode::Merge
      when "overwrite" then AAG::PutMode::Overwrite
      else
        nil
      end
    end
  end
end
