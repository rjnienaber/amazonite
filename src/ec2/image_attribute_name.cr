private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageAttributeName
    Description
    Kernel
    Ramdisk
    LaunchPermission
    ProductCodes
    BlockDeviceMapping
    SriovNetSupport
    BootMode
    TpmSupport
    UefiData
    LastLaunchedTime
    ImdsSupport
    DeregistrationProtection

    def self.to_json(e : ImageAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageAttributeName::Description              then "description"
              when AEC::ImageAttributeName::Kernel                   then "kernel"
              when AEC::ImageAttributeName::Ramdisk                  then "ramdisk"
              when AEC::ImageAttributeName::LaunchPermission         then "launchPermission"
              when AEC::ImageAttributeName::ProductCodes             then "productCodes"
              when AEC::ImageAttributeName::BlockDeviceMapping       then "blockDeviceMapping"
              when AEC::ImageAttributeName::SriovNetSupport          then "sriovNetSupport"
              when AEC::ImageAttributeName::BootMode                 then "bootMode"
              when AEC::ImageAttributeName::TpmSupport               then "tpmSupport"
              when AEC::ImageAttributeName::UefiData                 then "uefiData"
              when AEC::ImageAttributeName::LastLaunchedTime         then "lastLaunchedTime"
              when AEC::ImageAttributeName::ImdsSupport              then "imdsSupport"
              when AEC::ImageAttributeName::DeregistrationProtection then "deregistrationProtection"
              else
                raise Exception.new("unknown enum value for 'ImageAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageAttributeName
      value = pull.read_string
      case value
      when "description"              then AEC::ImageAttributeName::Description
      when "kernel"                   then AEC::ImageAttributeName::Kernel
      when "ramdisk"                  then AEC::ImageAttributeName::Ramdisk
      when "launchPermission"         then AEC::ImageAttributeName::LaunchPermission
      when "productCodes"             then AEC::ImageAttributeName::ProductCodes
      when "blockDeviceMapping"       then AEC::ImageAttributeName::BlockDeviceMapping
      when "sriovNetSupport"          then AEC::ImageAttributeName::SriovNetSupport
      when "bootMode"                 then AEC::ImageAttributeName::BootMode
      when "tpmSupport"               then AEC::ImageAttributeName::TpmSupport
      when "uefiData"                 then AEC::ImageAttributeName::UefiData
      when "lastLaunchedTime"         then AEC::ImageAttributeName::LastLaunchedTime
      when "imdsSupport"              then AEC::ImageAttributeName::ImdsSupport
      when "deregistrationProtection" then AEC::ImageAttributeName::DeregistrationProtection
      else
        raise Exception.new("unknown enum value for 'ImageAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageAttributeName::Description              then "description"
      when AEC::ImageAttributeName::Kernel                   then "kernel"
      when AEC::ImageAttributeName::Ramdisk                  then "ramdisk"
      when AEC::ImageAttributeName::LaunchPermission         then "launchPermission"
      when AEC::ImageAttributeName::ProductCodes             then "productCodes"
      when AEC::ImageAttributeName::BlockDeviceMapping       then "blockDeviceMapping"
      when AEC::ImageAttributeName::SriovNetSupport          then "sriovNetSupport"
      when AEC::ImageAttributeName::BootMode                 then "bootMode"
      when AEC::ImageAttributeName::TpmSupport               then "tpmSupport"
      when AEC::ImageAttributeName::UefiData                 then "uefiData"
      when AEC::ImageAttributeName::LastLaunchedTime         then "lastLaunchedTime"
      when AEC::ImageAttributeName::ImdsSupport              then "imdsSupport"
      when AEC::ImageAttributeName::DeregistrationProtection then "deregistrationProtection"
      else
        raise Exception.new("unknown enum value for 'ImageAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageAttributeName?
      case key
      when "description"              then AEC::ImageAttributeName::Description
      when "kernel"                   then AEC::ImageAttributeName::Kernel
      when "ramdisk"                  then AEC::ImageAttributeName::Ramdisk
      when "launchPermission"         then AEC::ImageAttributeName::LaunchPermission
      when "productCodes"             then AEC::ImageAttributeName::ProductCodes
      when "blockDeviceMapping"       then AEC::ImageAttributeName::BlockDeviceMapping
      when "sriovNetSupport"          then AEC::ImageAttributeName::SriovNetSupport
      when "bootMode"                 then AEC::ImageAttributeName::BootMode
      when "tpmSupport"               then AEC::ImageAttributeName::TpmSupport
      when "uefiData"                 then AEC::ImageAttributeName::UefiData
      when "lastLaunchedTime"         then AEC::ImageAttributeName::LastLaunchedTime
      when "imdsSupport"              then AEC::ImageAttributeName::ImdsSupport
      when "deregistrationProtection" then AEC::ImageAttributeName::DeregistrationProtection
      else
        nil
      end
    end
  end
end
