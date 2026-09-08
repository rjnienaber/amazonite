private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPublicAddressAwsService
    NatGateway
    DatabaseMigrationService
    Redshift
    ElasticContainerService
    RelationalDatabaseService
    SiteToSiteVpn
    LoadBalancer
    GlobalAccelerator
    Cloudfront
    Other

    def self.to_json(e : IpamPublicAddressAwsService, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPublicAddressAwsService::NatGateway                then "nat-gateway"
              when AEC::IpamPublicAddressAwsService::DatabaseMigrationService  then "database-migration-service"
              when AEC::IpamPublicAddressAwsService::Redshift                  then "redshift"
              when AEC::IpamPublicAddressAwsService::ElasticContainerService   then "elastic-container-service"
              when AEC::IpamPublicAddressAwsService::RelationalDatabaseService then "relational-database-service"
              when AEC::IpamPublicAddressAwsService::SiteToSiteVpn             then "site-to-site-vpn"
              when AEC::IpamPublicAddressAwsService::LoadBalancer              then "load-balancer"
              when AEC::IpamPublicAddressAwsService::GlobalAccelerator         then "global-accelerator"
              when AEC::IpamPublicAddressAwsService::Cloudfront                then "cloudfront"
              when AEC::IpamPublicAddressAwsService::Other                     then "other"
              else
                raise Exception.new("unknown enum value for 'IpamPublicAddressAwsService' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPublicAddressAwsService
      value = pull.read_string
      case value
      when "nat-gateway"                 then AEC::IpamPublicAddressAwsService::NatGateway
      when "database-migration-service"  then AEC::IpamPublicAddressAwsService::DatabaseMigrationService
      when "redshift"                    then AEC::IpamPublicAddressAwsService::Redshift
      when "elastic-container-service"   then AEC::IpamPublicAddressAwsService::ElasticContainerService
      when "relational-database-service" then AEC::IpamPublicAddressAwsService::RelationalDatabaseService
      when "site-to-site-vpn"            then AEC::IpamPublicAddressAwsService::SiteToSiteVpn
      when "load-balancer"               then AEC::IpamPublicAddressAwsService::LoadBalancer
      when "global-accelerator"          then AEC::IpamPublicAddressAwsService::GlobalAccelerator
      when "cloudfront"                  then AEC::IpamPublicAddressAwsService::Cloudfront
      when "other"                       then AEC::IpamPublicAddressAwsService::Other
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressAwsService' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPublicAddressAwsService::NatGateway                then "nat-gateway"
      when AEC::IpamPublicAddressAwsService::DatabaseMigrationService  then "database-migration-service"
      when AEC::IpamPublicAddressAwsService::Redshift                  then "redshift"
      when AEC::IpamPublicAddressAwsService::ElasticContainerService   then "elastic-container-service"
      when AEC::IpamPublicAddressAwsService::RelationalDatabaseService then "relational-database-service"
      when AEC::IpamPublicAddressAwsService::SiteToSiteVpn             then "site-to-site-vpn"
      when AEC::IpamPublicAddressAwsService::LoadBalancer              then "load-balancer"
      when AEC::IpamPublicAddressAwsService::GlobalAccelerator         then "global-accelerator"
      when AEC::IpamPublicAddressAwsService::Cloudfront                then "cloudfront"
      when AEC::IpamPublicAddressAwsService::Other                     then "other"
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressAwsService' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPublicAddressAwsService?
      case key
      when "nat-gateway"                 then AEC::IpamPublicAddressAwsService::NatGateway
      when "database-migration-service"  then AEC::IpamPublicAddressAwsService::DatabaseMigrationService
      when "redshift"                    then AEC::IpamPublicAddressAwsService::Redshift
      when "elastic-container-service"   then AEC::IpamPublicAddressAwsService::ElasticContainerService
      when "relational-database-service" then AEC::IpamPublicAddressAwsService::RelationalDatabaseService
      when "site-to-site-vpn"            then AEC::IpamPublicAddressAwsService::SiteToSiteVpn
      when "load-balancer"               then AEC::IpamPublicAddressAwsService::LoadBalancer
      when "global-accelerator"          then AEC::IpamPublicAddressAwsService::GlobalAccelerator
      when "cloudfront"                  then AEC::IpamPublicAddressAwsService::Cloudfront
      when "other"                       then AEC::IpamPublicAddressAwsService::Other
      else
        nil
      end
    end
  end
end
