private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ManagedBy
    Account
    DeclarativePolicy

    def self.to_json(e : ManagedBy, json : JSON::Builder) : Nil
      value = case e
              when AEC::ManagedBy::Account           then "account"
              when AEC::ManagedBy::DeclarativePolicy then "declarative-policy"
              else
                raise Exception.new("unknown enum value for 'ManagedBy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ManagedBy
      value = pull.read_string
      case value
      when "account"            then AEC::ManagedBy::Account
      when "declarative-policy" then AEC::ManagedBy::DeclarativePolicy
      else
        raise Exception.new("unknown enum value for 'ManagedBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ManagedBy::Account           then "account"
      when AEC::ManagedBy::DeclarativePolicy then "declarative-policy"
      else
        raise Exception.new("unknown enum value for 'ManagedBy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ManagedBy?
      case key
      when "account"            then AEC::ManagedBy::Account
      when "declarative-policy" then AEC::ManagedBy::DeclarativePolicy
      else
        nil
      end
    end
  end
end
