private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum DeliveryDestinationType
    S3
    Cwl
    Fh
    Xray

    def self.to_json(e : DeliveryDestinationType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::DeliveryDestinationType::S3   then "S3"
              when ACWL::DeliveryDestinationType::Cwl  then "CWL"
              when ACWL::DeliveryDestinationType::Fh   then "FH"
              when ACWL::DeliveryDestinationType::Xray then "XRAY"
              else
                raise Exception.new("unknown enum value for 'DeliveryDestinationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::DeliveryDestinationType
      value = pull.read_string
      case value
      when "S3"   then ACWL::DeliveryDestinationType::S3
      when "CWL"  then ACWL::DeliveryDestinationType::Cwl
      when "FH"   then ACWL::DeliveryDestinationType::Fh
      when "XRAY" then ACWL::DeliveryDestinationType::Xray
      else
        raise Exception.new("unknown enum value for 'DeliveryDestinationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::DeliveryDestinationType::S3   then "S3"
      when ACWL::DeliveryDestinationType::Cwl  then "CWL"
      when ACWL::DeliveryDestinationType::Fh   then "FH"
      when ACWL::DeliveryDestinationType::Xray then "XRAY"
      else
        raise Exception.new("unknown enum value for 'DeliveryDestinationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::DeliveryDestinationType?
      case key
      when "S3"   then ACWL::DeliveryDestinationType::S3
      when "CWL"  then ACWL::DeliveryDestinationType::Cwl
      when "FH"   then ACWL::DeliveryDestinationType::Fh
      when "XRAY" then ACWL::DeliveryDestinationType::Xray
      else
        nil
      end
    end
  end
end
