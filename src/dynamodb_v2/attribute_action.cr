private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum AttributeAction
    Add
    Put
    Delete

    def self.to_json(e : AttributeAction, json : JSON::Builder) : Nil
      value = case e
              when ADDB::AttributeAction::Add    then "ADD"
              when ADDB::AttributeAction::Put    then "PUT"
              when ADDB::AttributeAction::Delete then "DELETE"
              else
                raise Exception.new("unknown enum value for 'AttributeAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::AttributeAction
      value = pull.read_string
      case value
      when "ADD"    then ADDB::AttributeAction::Add
      when "PUT"    then ADDB::AttributeAction::Put
      when "DELETE" then ADDB::AttributeAction::Delete
      else
        raise Exception.new("unknown enum value for 'AttributeAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::AttributeAction::Add    then "ADD"
      when ADDB::AttributeAction::Put    then "PUT"
      when ADDB::AttributeAction::Delete then "DELETE"
      else
        raise Exception.new("unknown enum value for 'AttributeAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::AttributeAction?
      case key
      when "ADD"    then ADDB::AttributeAction::Add
      when "PUT"    then ADDB::AttributeAction::Put
      when "DELETE" then ADDB::AttributeAction::Delete
      else
        nil
      end
    end
  end
end
