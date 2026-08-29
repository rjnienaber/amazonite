private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum OnStackFailure
    DoNothing
    Rollback
    Delete

    def self.to_json(e : OnStackFailure, json : JSON::Builder) : Nil
      value = case e
              when ACF::OnStackFailure::DoNothing then "DO_NOTHING"
              when ACF::OnStackFailure::Rollback  then "ROLLBACK"
              when ACF::OnStackFailure::Delete    then "DELETE"
              else
                raise Exception.new("unknown enum value for 'OnStackFailure' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OnStackFailure
      value = pull.read_string
      case value
      when "DO_NOTHING" then ACF::OnStackFailure::DoNothing
      when "ROLLBACK"   then ACF::OnStackFailure::Rollback
      when "DELETE"     then ACF::OnStackFailure::Delete
      else
        raise Exception.new("unknown enum value for 'OnStackFailure' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OnStackFailure::DoNothing then "DO_NOTHING"
      when ACF::OnStackFailure::Rollback  then "ROLLBACK"
      when ACF::OnStackFailure::Delete    then "DELETE"
      else
        raise Exception.new("unknown enum value for 'OnStackFailure' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OnStackFailure?
      case key
      when "DO_NOTHING" then ACF::OnStackFailure::DoNothing
      when "ROLLBACK"   then ACF::OnStackFailure::Rollback
      when "DELETE"     then ACF::OnStackFailure::Delete
      else
        nil
      end
    end
  end
end
