private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DescribeActivationsFilterKeys
    ActivationIds
    DefaultInstanceName
    IamRole

    def self.to_json(e : DescribeActivationsFilterKeys, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DescribeActivationsFilterKeys
      value = pull.read_string
      case value
      when "ActivationIds"       then AS::DescribeActivationsFilterKeys::ActivationIds
      when "DefaultInstanceName" then AS::DescribeActivationsFilterKeys::DefaultInstanceName
      when "IamRole"             then AS::DescribeActivationsFilterKeys::IamRole
      else
        raise Exception.new("unknown enum value for 'DescribeActivationsFilterKeys' when deserializing from json: '#{value}'")
      end
    end
  end
end
