private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum OperationType
    Add
    Remove

    def self.to_json(e : OperationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::OperationType::Add    then "add"
              when AEC::OperationType::Remove then "remove"
              else
                raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::OperationType
      value = pull.read_string
      case value
      when "add"    then AEC::OperationType::Add
      when "remove" then AEC::OperationType::Remove
      else
        raise Exception.new("unknown enum value for 'OperationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::OperationType::Add    then "add"
      when AEC::OperationType::Remove then "remove"
      else
        raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::OperationType?
      case key
      when "add"    then AEC::OperationType::Add
      when "remove" then AEC::OperationType::Remove
      else
        nil
      end
    end
  end
end
