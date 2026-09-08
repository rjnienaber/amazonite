private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationInstancePlatform
    LinuxUnix
    RedHatEnterpriseLinux
    SuseLinux
    Windows
    WindowsWithSqlServer
    WindowsWithSqlServerEnterprise
    WindowsWithSqlServerStandard
    WindowsWithSqlServerWeb
    LinuxWithSqlServerStandard
    LinuxWithSqlServerWeb
    LinuxWithSqlServerEnterprise
    RhelWithSqlServerStandard
    RhelWithSqlServerEnterprise
    RhelWithSqlServerWeb
    RhelWithHa
    RhelWithHaAndSqlServerStandard
    RhelWithHaAndSqlServerEnterprise
    UbuntuPro

    def self.to_json(e : CapacityReservationInstancePlatform, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationInstancePlatform::LinuxUnix                        then "Linux/UNIX"
              when AEC::CapacityReservationInstancePlatform::RedHatEnterpriseLinux            then "Red Hat Enterprise Linux"
              when AEC::CapacityReservationInstancePlatform::SuseLinux                        then "SUSE Linux"
              when AEC::CapacityReservationInstancePlatform::Windows                          then "Windows"
              when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServer             then "Windows with SQL Server"
              when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerEnterprise   then "Windows with SQL Server Enterprise"
              when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerStandard     then "Windows with SQL Server Standard"
              when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerWeb          then "Windows with SQL Server Web"
              when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerStandard       then "Linux with SQL Server Standard"
              when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerWeb            then "Linux with SQL Server Web"
              when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerEnterprise     then "Linux with SQL Server Enterprise"
              when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerStandard        then "RHEL with SQL Server Standard"
              when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerEnterprise      then "RHEL with SQL Server Enterprise"
              when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerWeb             then "RHEL with SQL Server Web"
              when AEC::CapacityReservationInstancePlatform::RhelWithHa                       then "RHEL with HA"
              when AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerStandard   then "RHEL with HA and SQL Server Standard"
              when AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerEnterprise then "RHEL with HA and SQL Server Enterprise"
              when AEC::CapacityReservationInstancePlatform::UbuntuPro                        then "Ubuntu Pro"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationInstancePlatform' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationInstancePlatform
      value = pull.read_string
      case value
      when "Linux/UNIX"                             then AEC::CapacityReservationInstancePlatform::LinuxUnix
      when "Red Hat Enterprise Linux"               then AEC::CapacityReservationInstancePlatform::RedHatEnterpriseLinux
      when "SUSE Linux"                             then AEC::CapacityReservationInstancePlatform::SuseLinux
      when "Windows"                                then AEC::CapacityReservationInstancePlatform::Windows
      when "Windows with SQL Server"                then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServer
      when "Windows with SQL Server Enterprise"     then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerEnterprise
      when "Windows with SQL Server Standard"       then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerStandard
      when "Windows with SQL Server Web"            then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerWeb
      when "Linux with SQL Server Standard"         then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerStandard
      when "Linux with SQL Server Web"              then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerWeb
      when "Linux with SQL Server Enterprise"       then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerEnterprise
      when "RHEL with SQL Server Standard"          then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerStandard
      when "RHEL with SQL Server Enterprise"        then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerEnterprise
      when "RHEL with SQL Server Web"               then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerWeb
      when "RHEL with HA"                           then AEC::CapacityReservationInstancePlatform::RhelWithHa
      when "RHEL with HA and SQL Server Standard"   then AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerStandard
      when "RHEL with HA and SQL Server Enterprise" then AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerEnterprise
      when "Ubuntu Pro"                             then AEC::CapacityReservationInstancePlatform::UbuntuPro
      else
        raise Exception.new("unknown enum value for 'CapacityReservationInstancePlatform' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationInstancePlatform::LinuxUnix                        then "Linux/UNIX"
      when AEC::CapacityReservationInstancePlatform::RedHatEnterpriseLinux            then "Red Hat Enterprise Linux"
      when AEC::CapacityReservationInstancePlatform::SuseLinux                        then "SUSE Linux"
      when AEC::CapacityReservationInstancePlatform::Windows                          then "Windows"
      when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServer             then "Windows with SQL Server"
      when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerEnterprise   then "Windows with SQL Server Enterprise"
      when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerStandard     then "Windows with SQL Server Standard"
      when AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerWeb          then "Windows with SQL Server Web"
      when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerStandard       then "Linux with SQL Server Standard"
      when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerWeb            then "Linux with SQL Server Web"
      when AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerEnterprise     then "Linux with SQL Server Enterprise"
      when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerStandard        then "RHEL with SQL Server Standard"
      when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerEnterprise      then "RHEL with SQL Server Enterprise"
      when AEC::CapacityReservationInstancePlatform::RhelWithSqlServerWeb             then "RHEL with SQL Server Web"
      when AEC::CapacityReservationInstancePlatform::RhelWithHa                       then "RHEL with HA"
      when AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerStandard   then "RHEL with HA and SQL Server Standard"
      when AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerEnterprise then "RHEL with HA and SQL Server Enterprise"
      when AEC::CapacityReservationInstancePlatform::UbuntuPro                        then "Ubuntu Pro"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationInstancePlatform' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationInstancePlatform?
      case key
      when "Linux/UNIX"                             then AEC::CapacityReservationInstancePlatform::LinuxUnix
      when "Red Hat Enterprise Linux"               then AEC::CapacityReservationInstancePlatform::RedHatEnterpriseLinux
      when "SUSE Linux"                             then AEC::CapacityReservationInstancePlatform::SuseLinux
      when "Windows"                                then AEC::CapacityReservationInstancePlatform::Windows
      when "Windows with SQL Server"                then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServer
      when "Windows with SQL Server Enterprise"     then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerEnterprise
      when "Windows with SQL Server Standard"       then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerStandard
      when "Windows with SQL Server Web"            then AEC::CapacityReservationInstancePlatform::WindowsWithSqlServerWeb
      when "Linux with SQL Server Standard"         then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerStandard
      when "Linux with SQL Server Web"              then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerWeb
      when "Linux with SQL Server Enterprise"       then AEC::CapacityReservationInstancePlatform::LinuxWithSqlServerEnterprise
      when "RHEL with SQL Server Standard"          then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerStandard
      when "RHEL with SQL Server Enterprise"        then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerEnterprise
      when "RHEL with SQL Server Web"               then AEC::CapacityReservationInstancePlatform::RhelWithSqlServerWeb
      when "RHEL with HA"                           then AEC::CapacityReservationInstancePlatform::RhelWithHa
      when "RHEL with HA and SQL Server Standard"   then AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerStandard
      when "RHEL with HA and SQL Server Enterprise" then AEC::CapacityReservationInstancePlatform::RhelWithHaAndSqlServerEnterprise
      when "Ubuntu Pro"                             then AEC::CapacityReservationInstancePlatform::UbuntuPro
      else
        nil
      end
    end
  end
end
