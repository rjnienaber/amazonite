private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ChangeSetType
    Create
    Update
    Import

    def self.to_json(e : ChangeSetType, json : JSON::Builder) : Nil
      value = case e
              when ACF::ChangeSetType::Create then "CREATE"
              when ACF::ChangeSetType::Update then "UPDATE"
              when ACF::ChangeSetType::Import then "IMPORT"
              else
                raise Exception.new("unknown enum value for 'ChangeSetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeSetType
      value = pull.read_string
      case value
      when "CREATE" then ACF::ChangeSetType::Create
      when "UPDATE" then ACF::ChangeSetType::Update
      when "IMPORT" then ACF::ChangeSetType::Import
      else
        raise Exception.new("unknown enum value for 'ChangeSetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ChangeSetType::Create then "CREATE"
      when ACF::ChangeSetType::Update then "UPDATE"
      when ACF::ChangeSetType::Import then "IMPORT"
      else
        raise Exception.new("unknown enum value for 'ChangeSetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeSetType?
      case key
      when "CREATE" then ACF::ChangeSetType::Create
      when "UPDATE" then ACF::ChangeSetType::Update
      when "IMPORT" then ACF::ChangeSetType::Import
      else
        nil
      end
    end
  end
end
