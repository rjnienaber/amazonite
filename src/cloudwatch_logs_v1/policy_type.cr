private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum PolicyType
    DataProtectionPolicy
    SubscriptionFilterPolicy
    FieldIndexPolicy
    TransformerPolicy
    MetricExtractionPolicy

    def self.to_json(e : PolicyType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::PolicyType::DataProtectionPolicy     then "DATA_PROTECTION_POLICY"
              when ACWL::PolicyType::SubscriptionFilterPolicy then "SUBSCRIPTION_FILTER_POLICY"
              when ACWL::PolicyType::FieldIndexPolicy         then "FIELD_INDEX_POLICY"
              when ACWL::PolicyType::TransformerPolicy        then "TRANSFORMER_POLICY"
              when ACWL::PolicyType::MetricExtractionPolicy   then "METRIC_EXTRACTION_POLICY"
              else
                raise Exception.new("unknown enum value for 'PolicyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::PolicyType
      value = pull.read_string
      case value
      when "DATA_PROTECTION_POLICY"     then ACWL::PolicyType::DataProtectionPolicy
      when "SUBSCRIPTION_FILTER_POLICY" then ACWL::PolicyType::SubscriptionFilterPolicy
      when "FIELD_INDEX_POLICY"         then ACWL::PolicyType::FieldIndexPolicy
      when "TRANSFORMER_POLICY"         then ACWL::PolicyType::TransformerPolicy
      when "METRIC_EXTRACTION_POLICY"   then ACWL::PolicyType::MetricExtractionPolicy
      else
        raise Exception.new("unknown enum value for 'PolicyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::PolicyType::DataProtectionPolicy     then "DATA_PROTECTION_POLICY"
      when ACWL::PolicyType::SubscriptionFilterPolicy then "SUBSCRIPTION_FILTER_POLICY"
      when ACWL::PolicyType::FieldIndexPolicy         then "FIELD_INDEX_POLICY"
      when ACWL::PolicyType::TransformerPolicy        then "TRANSFORMER_POLICY"
      when ACWL::PolicyType::MetricExtractionPolicy   then "METRIC_EXTRACTION_POLICY"
      else
        raise Exception.new("unknown enum value for 'PolicyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::PolicyType?
      case key
      when "DATA_PROTECTION_POLICY"     then ACWL::PolicyType::DataProtectionPolicy
      when "SUBSCRIPTION_FILTER_POLICY" then ACWL::PolicyType::SubscriptionFilterPolicy
      when "FIELD_INDEX_POLICY"         then ACWL::PolicyType::FieldIndexPolicy
      when "TRANSFORMER_POLICY"         then ACWL::PolicyType::TransformerPolicy
      when "METRIC_EXTRACTION_POLICY"   then ACWL::PolicyType::MetricExtractionPolicy
      else
        nil
      end
    end
  end
end
