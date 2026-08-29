private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum DeletionMode
    Standard
    ForceDeleteStack

    def self.to_json(e : DeletionMode, json : JSON::Builder) : Nil
      value = case e
              when ACF::DeletionMode::Standard         then "STANDARD"
              when ACF::DeletionMode::ForceDeleteStack then "FORCE_DELETE_STACK"
              else
                raise Exception.new("unknown enum value for 'DeletionMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DeletionMode
      value = pull.read_string
      case value
      when "STANDARD"           then ACF::DeletionMode::Standard
      when "FORCE_DELETE_STACK" then ACF::DeletionMode::ForceDeleteStack
      else
        raise Exception.new("unknown enum value for 'DeletionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DeletionMode::Standard         then "STANDARD"
      when ACF::DeletionMode::ForceDeleteStack then "FORCE_DELETE_STACK"
      else
        raise Exception.new("unknown enum value for 'DeletionMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DeletionMode?
      case key
      when "STANDARD"           then ACF::DeletionMode::Standard
      when "FORCE_DELETE_STACK" then ACF::DeletionMode::ForceDeleteStack
      else
        nil
      end
    end
  end
end
