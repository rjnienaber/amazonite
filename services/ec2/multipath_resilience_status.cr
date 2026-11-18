private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MultipathResilienceStatus
    Pending
    Enabled
    Disabled

    def self.to_json(e : MultipathResilienceStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::MultipathResilienceStatus::Pending  then "pending"
              when AEC::MultipathResilienceStatus::Enabled  then "enabled"
              when AEC::MultipathResilienceStatus::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'MultipathResilienceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MultipathResilienceStatus
      value = pull.read_string
      case value
      when "pending"  then AEC::MultipathResilienceStatus::Pending
      when "enabled"  then AEC::MultipathResilienceStatus::Enabled
      when "disabled" then AEC::MultipathResilienceStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'MultipathResilienceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MultipathResilienceStatus::Pending  then "pending"
      when AEC::MultipathResilienceStatus::Enabled  then "enabled"
      when AEC::MultipathResilienceStatus::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'MultipathResilienceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MultipathResilienceStatus?
      case key
      when "pending"  then AEC::MultipathResilienceStatus::Pending
      when "enabled"  then AEC::MultipathResilienceStatus::Enabled
      when "disabled" then AEC::MultipathResilienceStatus::Disabled
      else
        nil
      end
    end
  end
end
