private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum OrganizationStatus
    Enabled
    Disabled
    DisabledPermanently

    def self.to_json(e : OrganizationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::OrganizationStatus::Enabled             then "ENABLED"
              when ACF::OrganizationStatus::Disabled            then "DISABLED"
              when ACF::OrganizationStatus::DisabledPermanently then "DISABLED_PERMANENTLY"
              else
                raise Exception.new("unknown enum value for 'OrganizationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OrganizationStatus
      value = pull.read_string
      case value
      when "ENABLED"              then ACF::OrganizationStatus::Enabled
      when "DISABLED"             then ACF::OrganizationStatus::Disabled
      when "DISABLED_PERMANENTLY" then ACF::OrganizationStatus::DisabledPermanently
      else
        raise Exception.new("unknown enum value for 'OrganizationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OrganizationStatus::Enabled             then "ENABLED"
      when ACF::OrganizationStatus::Disabled            then "DISABLED"
      when ACF::OrganizationStatus::DisabledPermanently then "DISABLED_PERMANENTLY"
      else
        raise Exception.new("unknown enum value for 'OrganizationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OrganizationStatus?
      case key
      when "ENABLED"              then ACF::OrganizationStatus::Enabled
      when "DISABLED"             then ACF::OrganizationStatus::Disabled
      when "DISABLED_PERMANENTLY" then ACF::OrganizationStatus::DisabledPermanently
      else
        nil
      end
    end
  end
end
