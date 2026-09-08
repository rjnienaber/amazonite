private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketLocationConstraint
    AfSouth1
    ApEast1
    ApEast2
    ApNortheast1
    ApNortheast2
    ApNortheast3
    ApSouth1
    ApSouth2
    ApSoutheast1
    ApSoutheast2
    ApSoutheast3
    ApSoutheast4
    ApSoutheast5
    ApSoutheast6
    ApSoutheast7
    CaCentral1
    CaWest1
    CnNorth1
    CnNorthwest1
    Eu
    EuCentral1
    EuCentral2
    EuNorth1
    EuSouth1
    EuSouth2
    EuWest1
    EuWest2
    EuWest3
    IlCentral1
    MeCentral1
    MeSouth1
    MxCentral1
    SaEast1
    UsEast2
    UsGovEast1
    UsGovWest1
    UsWest1
    UsWest2

    def self.to_json(e : BucketLocationConstraint, json : JSON::Builder) : Nil
      value = case e
              when AS::BucketLocationConstraint::AfSouth1     then "af-south-1"
              when AS::BucketLocationConstraint::ApEast1      then "ap-east-1"
              when AS::BucketLocationConstraint::ApEast2      then "ap-east-2"
              when AS::BucketLocationConstraint::ApNortheast1 then "ap-northeast-1"
              when AS::BucketLocationConstraint::ApNortheast2 then "ap-northeast-2"
              when AS::BucketLocationConstraint::ApNortheast3 then "ap-northeast-3"
              when AS::BucketLocationConstraint::ApSouth1     then "ap-south-1"
              when AS::BucketLocationConstraint::ApSouth2     then "ap-south-2"
              when AS::BucketLocationConstraint::ApSoutheast1 then "ap-southeast-1"
              when AS::BucketLocationConstraint::ApSoutheast2 then "ap-southeast-2"
              when AS::BucketLocationConstraint::ApSoutheast3 then "ap-southeast-3"
              when AS::BucketLocationConstraint::ApSoutheast4 then "ap-southeast-4"
              when AS::BucketLocationConstraint::ApSoutheast5 then "ap-southeast-5"
              when AS::BucketLocationConstraint::ApSoutheast6 then "ap-southeast-6"
              when AS::BucketLocationConstraint::ApSoutheast7 then "ap-southeast-7"
              when AS::BucketLocationConstraint::CaCentral1   then "ca-central-1"
              when AS::BucketLocationConstraint::CaWest1      then "ca-west-1"
              when AS::BucketLocationConstraint::CnNorth1     then "cn-north-1"
              when AS::BucketLocationConstraint::CnNorthwest1 then "cn-northwest-1"
              when AS::BucketLocationConstraint::Eu           then "EU"
              when AS::BucketLocationConstraint::EuCentral1   then "eu-central-1"
              when AS::BucketLocationConstraint::EuCentral2   then "eu-central-2"
              when AS::BucketLocationConstraint::EuNorth1     then "eu-north-1"
              when AS::BucketLocationConstraint::EuSouth1     then "eu-south-1"
              when AS::BucketLocationConstraint::EuSouth2     then "eu-south-2"
              when AS::BucketLocationConstraint::EuWest1      then "eu-west-1"
              when AS::BucketLocationConstraint::EuWest2      then "eu-west-2"
              when AS::BucketLocationConstraint::EuWest3      then "eu-west-3"
              when AS::BucketLocationConstraint::IlCentral1   then "il-central-1"
              when AS::BucketLocationConstraint::MeCentral1   then "me-central-1"
              when AS::BucketLocationConstraint::MeSouth1     then "me-south-1"
              when AS::BucketLocationConstraint::MxCentral1   then "mx-central-1"
              when AS::BucketLocationConstraint::SaEast1      then "sa-east-1"
              when AS::BucketLocationConstraint::UsEast2      then "us-east-2"
              when AS::BucketLocationConstraint::UsGovEast1   then "us-gov-east-1"
              when AS::BucketLocationConstraint::UsGovWest1   then "us-gov-west-1"
              when AS::BucketLocationConstraint::UsWest1      then "us-west-1"
              when AS::BucketLocationConstraint::UsWest2      then "us-west-2"
              else
                raise Exception.new("unknown enum value for 'BucketLocationConstraint' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketLocationConstraint
      value = pull.read_string
      case value
      when "af-south-1"     then AS::BucketLocationConstraint::AfSouth1
      when "ap-east-1"      then AS::BucketLocationConstraint::ApEast1
      when "ap-east-2"      then AS::BucketLocationConstraint::ApEast2
      when "ap-northeast-1" then AS::BucketLocationConstraint::ApNortheast1
      when "ap-northeast-2" then AS::BucketLocationConstraint::ApNortheast2
      when "ap-northeast-3" then AS::BucketLocationConstraint::ApNortheast3
      when "ap-south-1"     then AS::BucketLocationConstraint::ApSouth1
      when "ap-south-2"     then AS::BucketLocationConstraint::ApSouth2
      when "ap-southeast-1" then AS::BucketLocationConstraint::ApSoutheast1
      when "ap-southeast-2" then AS::BucketLocationConstraint::ApSoutheast2
      when "ap-southeast-3" then AS::BucketLocationConstraint::ApSoutheast3
      when "ap-southeast-4" then AS::BucketLocationConstraint::ApSoutheast4
      when "ap-southeast-5" then AS::BucketLocationConstraint::ApSoutheast5
      when "ap-southeast-6" then AS::BucketLocationConstraint::ApSoutheast6
      when "ap-southeast-7" then AS::BucketLocationConstraint::ApSoutheast7
      when "ca-central-1"   then AS::BucketLocationConstraint::CaCentral1
      when "ca-west-1"      then AS::BucketLocationConstraint::CaWest1
      when "cn-north-1"     then AS::BucketLocationConstraint::CnNorth1
      when "cn-northwest-1" then AS::BucketLocationConstraint::CnNorthwest1
      when "EU"             then AS::BucketLocationConstraint::Eu
      when "eu-central-1"   then AS::BucketLocationConstraint::EuCentral1
      when "eu-central-2"   then AS::BucketLocationConstraint::EuCentral2
      when "eu-north-1"     then AS::BucketLocationConstraint::EuNorth1
      when "eu-south-1"     then AS::BucketLocationConstraint::EuSouth1
      when "eu-south-2"     then AS::BucketLocationConstraint::EuSouth2
      when "eu-west-1"      then AS::BucketLocationConstraint::EuWest1
      when "eu-west-2"      then AS::BucketLocationConstraint::EuWest2
      when "eu-west-3"      then AS::BucketLocationConstraint::EuWest3
      when "il-central-1"   then AS::BucketLocationConstraint::IlCentral1
      when "me-central-1"   then AS::BucketLocationConstraint::MeCentral1
      when "me-south-1"     then AS::BucketLocationConstraint::MeSouth1
      when "mx-central-1"   then AS::BucketLocationConstraint::MxCentral1
      when "sa-east-1"      then AS::BucketLocationConstraint::SaEast1
      when "us-east-2"      then AS::BucketLocationConstraint::UsEast2
      when "us-gov-east-1"  then AS::BucketLocationConstraint::UsGovEast1
      when "us-gov-west-1"  then AS::BucketLocationConstraint::UsGovWest1
      when "us-west-1"      then AS::BucketLocationConstraint::UsWest1
      when "us-west-2"      then AS::BucketLocationConstraint::UsWest2
      else
        raise Exception.new("unknown enum value for 'BucketLocationConstraint' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::BucketLocationConstraint::AfSouth1     then "af-south-1"
      when AS::BucketLocationConstraint::ApEast1      then "ap-east-1"
      when AS::BucketLocationConstraint::ApEast2      then "ap-east-2"
      when AS::BucketLocationConstraint::ApNortheast1 then "ap-northeast-1"
      when AS::BucketLocationConstraint::ApNortheast2 then "ap-northeast-2"
      when AS::BucketLocationConstraint::ApNortheast3 then "ap-northeast-3"
      when AS::BucketLocationConstraint::ApSouth1     then "ap-south-1"
      when AS::BucketLocationConstraint::ApSouth2     then "ap-south-2"
      when AS::BucketLocationConstraint::ApSoutheast1 then "ap-southeast-1"
      when AS::BucketLocationConstraint::ApSoutheast2 then "ap-southeast-2"
      when AS::BucketLocationConstraint::ApSoutheast3 then "ap-southeast-3"
      when AS::BucketLocationConstraint::ApSoutheast4 then "ap-southeast-4"
      when AS::BucketLocationConstraint::ApSoutheast5 then "ap-southeast-5"
      when AS::BucketLocationConstraint::ApSoutheast6 then "ap-southeast-6"
      when AS::BucketLocationConstraint::ApSoutheast7 then "ap-southeast-7"
      when AS::BucketLocationConstraint::CaCentral1   then "ca-central-1"
      when AS::BucketLocationConstraint::CaWest1      then "ca-west-1"
      when AS::BucketLocationConstraint::CnNorth1     then "cn-north-1"
      when AS::BucketLocationConstraint::CnNorthwest1 then "cn-northwest-1"
      when AS::BucketLocationConstraint::Eu           then "EU"
      when AS::BucketLocationConstraint::EuCentral1   then "eu-central-1"
      when AS::BucketLocationConstraint::EuCentral2   then "eu-central-2"
      when AS::BucketLocationConstraint::EuNorth1     then "eu-north-1"
      when AS::BucketLocationConstraint::EuSouth1     then "eu-south-1"
      when AS::BucketLocationConstraint::EuSouth2     then "eu-south-2"
      when AS::BucketLocationConstraint::EuWest1      then "eu-west-1"
      when AS::BucketLocationConstraint::EuWest2      then "eu-west-2"
      when AS::BucketLocationConstraint::EuWest3      then "eu-west-3"
      when AS::BucketLocationConstraint::IlCentral1   then "il-central-1"
      when AS::BucketLocationConstraint::MeCentral1   then "me-central-1"
      when AS::BucketLocationConstraint::MeSouth1     then "me-south-1"
      when AS::BucketLocationConstraint::MxCentral1   then "mx-central-1"
      when AS::BucketLocationConstraint::SaEast1      then "sa-east-1"
      when AS::BucketLocationConstraint::UsEast2      then "us-east-2"
      when AS::BucketLocationConstraint::UsGovEast1   then "us-gov-east-1"
      when AS::BucketLocationConstraint::UsGovWest1   then "us-gov-west-1"
      when AS::BucketLocationConstraint::UsWest1      then "us-west-1"
      when AS::BucketLocationConstraint::UsWest2      then "us-west-2"
      else
        raise Exception.new("unknown enum value for 'BucketLocationConstraint' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::BucketLocationConstraint?
      case key
      when "af-south-1"     then AS::BucketLocationConstraint::AfSouth1
      when "ap-east-1"      then AS::BucketLocationConstraint::ApEast1
      when "ap-east-2"      then AS::BucketLocationConstraint::ApEast2
      when "ap-northeast-1" then AS::BucketLocationConstraint::ApNortheast1
      when "ap-northeast-2" then AS::BucketLocationConstraint::ApNortheast2
      when "ap-northeast-3" then AS::BucketLocationConstraint::ApNortheast3
      when "ap-south-1"     then AS::BucketLocationConstraint::ApSouth1
      when "ap-south-2"     then AS::BucketLocationConstraint::ApSouth2
      when "ap-southeast-1" then AS::BucketLocationConstraint::ApSoutheast1
      when "ap-southeast-2" then AS::BucketLocationConstraint::ApSoutheast2
      when "ap-southeast-3" then AS::BucketLocationConstraint::ApSoutheast3
      when "ap-southeast-4" then AS::BucketLocationConstraint::ApSoutheast4
      when "ap-southeast-5" then AS::BucketLocationConstraint::ApSoutheast5
      when "ap-southeast-6" then AS::BucketLocationConstraint::ApSoutheast6
      when "ap-southeast-7" then AS::BucketLocationConstraint::ApSoutheast7
      when "ca-central-1"   then AS::BucketLocationConstraint::CaCentral1
      when "ca-west-1"      then AS::BucketLocationConstraint::CaWest1
      when "cn-north-1"     then AS::BucketLocationConstraint::CnNorth1
      when "cn-northwest-1" then AS::BucketLocationConstraint::CnNorthwest1
      when "EU"             then AS::BucketLocationConstraint::Eu
      when "eu-central-1"   then AS::BucketLocationConstraint::EuCentral1
      when "eu-central-2"   then AS::BucketLocationConstraint::EuCentral2
      when "eu-north-1"     then AS::BucketLocationConstraint::EuNorth1
      when "eu-south-1"     then AS::BucketLocationConstraint::EuSouth1
      when "eu-south-2"     then AS::BucketLocationConstraint::EuSouth2
      when "eu-west-1"      then AS::BucketLocationConstraint::EuWest1
      when "eu-west-2"      then AS::BucketLocationConstraint::EuWest2
      when "eu-west-3"      then AS::BucketLocationConstraint::EuWest3
      when "il-central-1"   then AS::BucketLocationConstraint::IlCentral1
      when "me-central-1"   then AS::BucketLocationConstraint::MeCentral1
      when "me-south-1"     then AS::BucketLocationConstraint::MeSouth1
      when "mx-central-1"   then AS::BucketLocationConstraint::MxCentral1
      when "sa-east-1"      then AS::BucketLocationConstraint::SaEast1
      when "us-east-2"      then AS::BucketLocationConstraint::UsEast2
      when "us-gov-east-1"  then AS::BucketLocationConstraint::UsGovEast1
      when "us-gov-west-1"  then AS::BucketLocationConstraint::UsGovWest1
      when "us-west-1"      then AS::BucketLocationConstraint::UsWest1
      when "us-west-2"      then AS::BucketLocationConstraint::UsWest2
      else
        nil
      end
    end
  end
end
