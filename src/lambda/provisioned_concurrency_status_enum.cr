private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum ProvisionedConcurrencyStatusEnum
    InProgress
    Ready
    Failed

    def self.to_json(e : ProvisionedConcurrencyStatusEnum, json : JSON::Builder) : Nil
      value = case e
              when AL::ProvisionedConcurrencyStatusEnum::InProgress then "IN_PROGRESS"
              when AL::ProvisionedConcurrencyStatusEnum::Ready      then "READY"
              when AL::ProvisionedConcurrencyStatusEnum::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ProvisionedConcurrencyStatusEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::ProvisionedConcurrencyStatusEnum
      value = pull.read_string
      case value
      when "IN_PROGRESS" then AL::ProvisionedConcurrencyStatusEnum::InProgress
      when "READY"       then AL::ProvisionedConcurrencyStatusEnum::Ready
      when "FAILED"      then AL::ProvisionedConcurrencyStatusEnum::Failed
      else
        raise Exception.new("unknown enum value for 'ProvisionedConcurrencyStatusEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::ProvisionedConcurrencyStatusEnum::InProgress then "IN_PROGRESS"
      when AL::ProvisionedConcurrencyStatusEnum::Ready      then "READY"
      when AL::ProvisionedConcurrencyStatusEnum::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ProvisionedConcurrencyStatusEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::ProvisionedConcurrencyStatusEnum?
      case key
      when "IN_PROGRESS" then AL::ProvisionedConcurrencyStatusEnum::InProgress
      when "READY"       then AL::ProvisionedConcurrencyStatusEnum::Ready
      when "FAILED"      then AL::ProvisionedConcurrencyStatusEnum::Failed
      else
        nil
      end
    end
  end
end
