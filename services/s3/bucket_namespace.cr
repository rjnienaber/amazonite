private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketNamespace
    AccountRegional
    Global

    def self.to_json(e : BucketNamespace, json : JSON::Builder) : Nil
      value = case e
              when AS::BucketNamespace::AccountRegional then "account-regional"
              when AS::BucketNamespace::Global          then "global"
              else
                raise Exception.new("unknown enum value for 'BucketNamespace' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketNamespace
      value = pull.read_string
      case value
      when "account-regional" then AS::BucketNamespace::AccountRegional
      when "global"           then AS::BucketNamespace::Global
      else
        raise Exception.new("unknown enum value for 'BucketNamespace' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::BucketNamespace::AccountRegional then "account-regional"
      when AS::BucketNamespace::Global          then "global"
      else
        raise Exception.new("unknown enum value for 'BucketNamespace' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::BucketNamespace?
      case key
      when "account-regional" then AS::BucketNamespace::AccountRegional
      when "global"           then AS::BucketNamespace::Global
      else
        nil
      end
    end
  end
end
