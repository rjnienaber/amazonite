private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OperatingSystem
    Windows
    AmazonLinux
    AmazonLinux2
    AmazonLinux2022
    Ubuntu
    RedhatEnterpriseLinux
    Suse
    Centos
    OracleLinux
    Debian
    Macos
    Raspbian
    RockyLinux
    AlmaLinux
    AmazonLinux2023

    def self.to_json(e : OperatingSystem, json : JSON::Builder) : Nil
      value = case e
              when AS::OperatingSystem::Windows               then "WINDOWS"
              when AS::OperatingSystem::AmazonLinux           then "AMAZON_LINUX"
              when AS::OperatingSystem::AmazonLinux2          then "AMAZON_LINUX_2"
              when AS::OperatingSystem::AmazonLinux2022       then "AMAZON_LINUX_2022"
              when AS::OperatingSystem::Ubuntu                then "UBUNTU"
              when AS::OperatingSystem::RedhatEnterpriseLinux then "REDHAT_ENTERPRISE_LINUX"
              when AS::OperatingSystem::Suse                  then "SUSE"
              when AS::OperatingSystem::Centos                then "CENTOS"
              when AS::OperatingSystem::OracleLinux           then "ORACLE_LINUX"
              when AS::OperatingSystem::Debian                then "DEBIAN"
              when AS::OperatingSystem::Macos                 then "MACOS"
              when AS::OperatingSystem::Raspbian              then "RASPBIAN"
              when AS::OperatingSystem::RockyLinux            then "ROCKY_LINUX"
              when AS::OperatingSystem::AlmaLinux             then "ALMA_LINUX"
              when AS::OperatingSystem::AmazonLinux2023       then "AMAZON_LINUX_2023"
              else
                raise Exception.new("unknown enum value for 'OperatingSystem' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OperatingSystem
      value = pull.read_string
      case value
      when "WINDOWS"                 then AS::OperatingSystem::Windows
      when "AMAZON_LINUX"            then AS::OperatingSystem::AmazonLinux
      when "AMAZON_LINUX_2"          then AS::OperatingSystem::AmazonLinux2
      when "AMAZON_LINUX_2022"       then AS::OperatingSystem::AmazonLinux2022
      when "UBUNTU"                  then AS::OperatingSystem::Ubuntu
      when "REDHAT_ENTERPRISE_LINUX" then AS::OperatingSystem::RedhatEnterpriseLinux
      when "SUSE"                    then AS::OperatingSystem::Suse
      when "CENTOS"                  then AS::OperatingSystem::Centos
      when "ORACLE_LINUX"            then AS::OperatingSystem::OracleLinux
      when "DEBIAN"                  then AS::OperatingSystem::Debian
      when "MACOS"                   then AS::OperatingSystem::Macos
      when "RASPBIAN"                then AS::OperatingSystem::Raspbian
      when "ROCKY_LINUX"             then AS::OperatingSystem::RockyLinux
      when "ALMA_LINUX"              then AS::OperatingSystem::AlmaLinux
      when "AMAZON_LINUX_2023"       then AS::OperatingSystem::AmazonLinux2023
      else
        raise Exception.new("unknown enum value for 'OperatingSystem' when deserializing from json: '#{value}'")
      end
    end
  end
end
