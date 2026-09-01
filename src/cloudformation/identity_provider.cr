private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum IdentityProvider
    AwsMarketplace
    GitHub
    Bitbucket

    def self.to_json(e : IdentityProvider, json : JSON::Builder) : Nil
      value = case e
              when ACF::IdentityProvider::AwsMarketplace then "AWS_Marketplace"
              when ACF::IdentityProvider::GitHub         then "GitHub"
              when ACF::IdentityProvider::Bitbucket      then "Bitbucket"
              else
                raise Exception.new("unknown enum value for 'IdentityProvider' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::IdentityProvider
      value = pull.read_string
      case value
      when "AWS_Marketplace" then ACF::IdentityProvider::AwsMarketplace
      when "GitHub"          then ACF::IdentityProvider::GitHub
      when "Bitbucket"       then ACF::IdentityProvider::Bitbucket
      else
        raise Exception.new("unknown enum value for 'IdentityProvider' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::IdentityProvider::AwsMarketplace then "AWS_Marketplace"
      when ACF::IdentityProvider::GitHub         then "GitHub"
      when ACF::IdentityProvider::Bitbucket      then "Bitbucket"
      else
        raise Exception.new("unknown enum value for 'IdentityProvider' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::IdentityProvider?
      case key
      when "AWS_Marketplace" then ACF::IdentityProvider::AwsMarketplace
      when "GitHub"          then ACF::IdentityProvider::GitHub
      when "Bitbucket"       then ACF::IdentityProvider::Bitbucket
      else
        nil
      end
    end
  end
end
