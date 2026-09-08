private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceAttributeName
    InstanceType
    Kernel
    Ramdisk
    UserData
    DisableApiTermination
    InstanceInitiatedShutdownBehavior
    RootDeviceName
    BlockDeviceMapping
    ProductCodes
    SourceDestCheck
    GroupSet
    EbsOptimized
    SriovNetSupport
    EnaSupport
    EnclaveOptions
    DisableApiStop

    def self.to_json(e : InstanceAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceAttributeName::InstanceType                      then "instanceType"
              when AEC::InstanceAttributeName::Kernel                            then "kernel"
              when AEC::InstanceAttributeName::Ramdisk                           then "ramdisk"
              when AEC::InstanceAttributeName::UserData                          then "userData"
              when AEC::InstanceAttributeName::DisableApiTermination             then "disableApiTermination"
              when AEC::InstanceAttributeName::InstanceInitiatedShutdownBehavior then "instanceInitiatedShutdownBehavior"
              when AEC::InstanceAttributeName::RootDeviceName                    then "rootDeviceName"
              when AEC::InstanceAttributeName::BlockDeviceMapping                then "blockDeviceMapping"
              when AEC::InstanceAttributeName::ProductCodes                      then "productCodes"
              when AEC::InstanceAttributeName::SourceDestCheck                   then "sourceDestCheck"
              when AEC::InstanceAttributeName::GroupSet                          then "groupSet"
              when AEC::InstanceAttributeName::EbsOptimized                      then "ebsOptimized"
              when AEC::InstanceAttributeName::SriovNetSupport                   then "sriovNetSupport"
              when AEC::InstanceAttributeName::EnaSupport                        then "enaSupport"
              when AEC::InstanceAttributeName::EnclaveOptions                    then "enclaveOptions"
              when AEC::InstanceAttributeName::DisableApiStop                    then "disableApiStop"
              else
                raise Exception.new("unknown enum value for 'InstanceAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceAttributeName
      value = pull.read_string
      case value
      when "instanceType"                      then AEC::InstanceAttributeName::InstanceType
      when "kernel"                            then AEC::InstanceAttributeName::Kernel
      when "ramdisk"                           then AEC::InstanceAttributeName::Ramdisk
      when "userData"                          then AEC::InstanceAttributeName::UserData
      when "disableApiTermination"             then AEC::InstanceAttributeName::DisableApiTermination
      when "instanceInitiatedShutdownBehavior" then AEC::InstanceAttributeName::InstanceInitiatedShutdownBehavior
      when "rootDeviceName"                    then AEC::InstanceAttributeName::RootDeviceName
      when "blockDeviceMapping"                then AEC::InstanceAttributeName::BlockDeviceMapping
      when "productCodes"                      then AEC::InstanceAttributeName::ProductCodes
      when "sourceDestCheck"                   then AEC::InstanceAttributeName::SourceDestCheck
      when "groupSet"                          then AEC::InstanceAttributeName::GroupSet
      when "ebsOptimized"                      then AEC::InstanceAttributeName::EbsOptimized
      when "sriovNetSupport"                   then AEC::InstanceAttributeName::SriovNetSupport
      when "enaSupport"                        then AEC::InstanceAttributeName::EnaSupport
      when "enclaveOptions"                    then AEC::InstanceAttributeName::EnclaveOptions
      when "disableApiStop"                    then AEC::InstanceAttributeName::DisableApiStop
      else
        raise Exception.new("unknown enum value for 'InstanceAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceAttributeName::InstanceType                      then "instanceType"
      when AEC::InstanceAttributeName::Kernel                            then "kernel"
      when AEC::InstanceAttributeName::Ramdisk                           then "ramdisk"
      when AEC::InstanceAttributeName::UserData                          then "userData"
      when AEC::InstanceAttributeName::DisableApiTermination             then "disableApiTermination"
      when AEC::InstanceAttributeName::InstanceInitiatedShutdownBehavior then "instanceInitiatedShutdownBehavior"
      when AEC::InstanceAttributeName::RootDeviceName                    then "rootDeviceName"
      when AEC::InstanceAttributeName::BlockDeviceMapping                then "blockDeviceMapping"
      when AEC::InstanceAttributeName::ProductCodes                      then "productCodes"
      when AEC::InstanceAttributeName::SourceDestCheck                   then "sourceDestCheck"
      when AEC::InstanceAttributeName::GroupSet                          then "groupSet"
      when AEC::InstanceAttributeName::EbsOptimized                      then "ebsOptimized"
      when AEC::InstanceAttributeName::SriovNetSupport                   then "sriovNetSupport"
      when AEC::InstanceAttributeName::EnaSupport                        then "enaSupport"
      when AEC::InstanceAttributeName::EnclaveOptions                    then "enclaveOptions"
      when AEC::InstanceAttributeName::DisableApiStop                    then "disableApiStop"
      else
        raise Exception.new("unknown enum value for 'InstanceAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceAttributeName?
      case key
      when "instanceType"                      then AEC::InstanceAttributeName::InstanceType
      when "kernel"                            then AEC::InstanceAttributeName::Kernel
      when "ramdisk"                           then AEC::InstanceAttributeName::Ramdisk
      when "userData"                          then AEC::InstanceAttributeName::UserData
      when "disableApiTermination"             then AEC::InstanceAttributeName::DisableApiTermination
      when "instanceInitiatedShutdownBehavior" then AEC::InstanceAttributeName::InstanceInitiatedShutdownBehavior
      when "rootDeviceName"                    then AEC::InstanceAttributeName::RootDeviceName
      when "blockDeviceMapping"                then AEC::InstanceAttributeName::BlockDeviceMapping
      when "productCodes"                      then AEC::InstanceAttributeName::ProductCodes
      when "sourceDestCheck"                   then AEC::InstanceAttributeName::SourceDestCheck
      when "groupSet"                          then AEC::InstanceAttributeName::GroupSet
      when "ebsOptimized"                      then AEC::InstanceAttributeName::EbsOptimized
      when "sriovNetSupport"                   then AEC::InstanceAttributeName::SriovNetSupport
      when "enaSupport"                        then AEC::InstanceAttributeName::EnaSupport
      when "enclaveOptions"                    then AEC::InstanceAttributeName::EnclaveOptions
      when "disableApiStop"                    then AEC::InstanceAttributeName::DisableApiStop
      else
        nil
      end
    end
  end
end
