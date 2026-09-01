private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum ResourceOwner
    Self
    OtherAccounts

    def self.to_json(e : ResourceOwner, json : JSON::Builder) : Nil
      value = case e
              when AAG::ResourceOwner::Self          then "SELF"
              when AAG::ResourceOwner::OtherAccounts then "OTHER_ACCOUNTS"
              else
                raise Exception.new("unknown enum value for 'ResourceOwner' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ResourceOwner
      value = pull.read_string
      case value
      when "SELF"           then AAG::ResourceOwner::Self
      when "OTHER_ACCOUNTS" then AAG::ResourceOwner::OtherAccounts
      else
        raise Exception.new("unknown enum value for 'ResourceOwner' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ResourceOwner::Self          then "SELF"
      when AAG::ResourceOwner::OtherAccounts then "OTHER_ACCOUNTS"
      else
        raise Exception.new("unknown enum value for 'ResourceOwner' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ResourceOwner?
      case key
      when "SELF"           then AAG::ResourceOwner::Self
      when "OTHER_ACCOUNTS" then AAG::ResourceOwner::OtherAccounts
      else
        nil
      end
    end
  end
end
