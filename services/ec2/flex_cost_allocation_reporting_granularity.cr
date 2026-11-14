private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The resource granularity level at which networking costs are allocated. Valid values are `eni`,
  # `ec2`, `subnet`, `vpc`, `account`, `peering-id`, and `cidr`.
  #
  # Which values you can use depends on the policy document. `peering-id` is valid only in a
  # `PcxFcaPolicyDocument`.
  enum FlexCostAllocationReportingGranularity
    Eni
    Ec2
    Subnet
    Vpc
    Account
    PeeringId
    Cidr

    def self.to_json(e : FlexCostAllocationReportingGranularity, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexCostAllocationReportingGranularity::Eni       then "eni"
              when AEC::FlexCostAllocationReportingGranularity::Ec2       then "ec2"
              when AEC::FlexCostAllocationReportingGranularity::Subnet    then "subnet"
              when AEC::FlexCostAllocationReportingGranularity::Vpc       then "vpc"
              when AEC::FlexCostAllocationReportingGranularity::Account   then "account"
              when AEC::FlexCostAllocationReportingGranularity::PeeringId then "peering-id"
              when AEC::FlexCostAllocationReportingGranularity::Cidr      then "cidr"
              else
                raise Exception.new("unknown enum value for 'FlexCostAllocationReportingGranularity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexCostAllocationReportingGranularity
      value = pull.read_string
      case value
      when "eni"        then AEC::FlexCostAllocationReportingGranularity::Eni
      when "ec2"        then AEC::FlexCostAllocationReportingGranularity::Ec2
      when "subnet"     then AEC::FlexCostAllocationReportingGranularity::Subnet
      when "vpc"        then AEC::FlexCostAllocationReportingGranularity::Vpc
      when "account"    then AEC::FlexCostAllocationReportingGranularity::Account
      when "peering-id" then AEC::FlexCostAllocationReportingGranularity::PeeringId
      when "cidr"       then AEC::FlexCostAllocationReportingGranularity::Cidr
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationReportingGranularity' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexCostAllocationReportingGranularity::Eni       then "eni"
      when AEC::FlexCostAllocationReportingGranularity::Ec2       then "ec2"
      when AEC::FlexCostAllocationReportingGranularity::Subnet    then "subnet"
      when AEC::FlexCostAllocationReportingGranularity::Vpc       then "vpc"
      when AEC::FlexCostAllocationReportingGranularity::Account   then "account"
      when AEC::FlexCostAllocationReportingGranularity::PeeringId then "peering-id"
      when AEC::FlexCostAllocationReportingGranularity::Cidr      then "cidr"
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationReportingGranularity' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexCostAllocationReportingGranularity?
      case key
      when "eni"        then AEC::FlexCostAllocationReportingGranularity::Eni
      when "ec2"        then AEC::FlexCostAllocationReportingGranularity::Ec2
      when "subnet"     then AEC::FlexCostAllocationReportingGranularity::Subnet
      when "vpc"        then AEC::FlexCostAllocationReportingGranularity::Vpc
      when "account"    then AEC::FlexCostAllocationReportingGranularity::Account
      when "peering-id" then AEC::FlexCostAllocationReportingGranularity::PeeringId
      when "cidr"       then AEC::FlexCostAllocationReportingGranularity::Cidr
      else
        nil
      end
    end
  end
end
