private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum OnFailure
    DoNothing
    Rollback
    Delete

    def self.to_json(e : OnFailure, json : JSON::Builder) : Nil
      value = case e
              when ACF::OnFailure::DoNothing then "DO_NOTHING"
              when ACF::OnFailure::Rollback  then "ROLLBACK"
              when ACF::OnFailure::Delete    then "DELETE"
              else
                raise Exception.new("unknown enum value for 'OnFailure' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OnFailure
      value = pull.read_string
      case value
      when "DO_NOTHING" then ACF::OnFailure::DoNothing
      when "ROLLBACK"   then ACF::OnFailure::Rollback
      when "DELETE"     then ACF::OnFailure::Delete
      else
        raise Exception.new("unknown enum value for 'OnFailure' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OnFailure::DoNothing then "DO_NOTHING"
      when ACF::OnFailure::Rollback  then "ROLLBACK"
      when ACF::OnFailure::Delete    then "DELETE"
      else
        raise Exception.new("unknown enum value for 'OnFailure' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OnFailure?
      case key
      when "DO_NOTHING" then ACF::OnFailure::DoNothing
      when "ROLLBACK"   then ACF::OnFailure::Rollback
      when "DELETE"     then ACF::OnFailure::Delete
      else
        nil
      end
    end
  end
end
