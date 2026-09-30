private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FilterByDimension
    ResourceRegion
    AvailabilityZoneId
    AccountId
    AccountName
    InstanceFamily
    InstanceType
    InstancePlatform
    ReservationArn
    ReservationId
    ReservationType
    ReservationCreateTimestamp
    ReservationStartTimestamp
    ReservationEndTimestamp
    ReservationEndDateType
    Tenancy
    ReservationState
    ReservationInstanceMatchCriteria
    ReservationUnusedFinancialOwner

    def self.to_json(e : FilterByDimension, json : JSON::Builder) : Nil
      value = case e
              when AEC::FilterByDimension::ResourceRegion                   then "resource-region"
              when AEC::FilterByDimension::AvailabilityZoneId               then "availability-zone-id"
              when AEC::FilterByDimension::AccountId                        then "account-id"
              when AEC::FilterByDimension::AccountName                      then "account-name"
              when AEC::FilterByDimension::InstanceFamily                   then "instance-family"
              when AEC::FilterByDimension::InstanceType                     then "instance-type"
              when AEC::FilterByDimension::InstancePlatform                 then "instance-platform"
              when AEC::FilterByDimension::ReservationArn                   then "reservation-arn"
              when AEC::FilterByDimension::ReservationId                    then "reservation-id"
              when AEC::FilterByDimension::ReservationType                  then "reservation-type"
              when AEC::FilterByDimension::ReservationCreateTimestamp       then "reservation-create-timestamp"
              when AEC::FilterByDimension::ReservationStartTimestamp        then "reservation-start-timestamp"
              when AEC::FilterByDimension::ReservationEndTimestamp          then "reservation-end-timestamp"
              when AEC::FilterByDimension::ReservationEndDateType           then "reservation-end-date-type"
              when AEC::FilterByDimension::Tenancy                          then "tenancy"
              when AEC::FilterByDimension::ReservationState                 then "reservation-state"
              when AEC::FilterByDimension::ReservationInstanceMatchCriteria then "reservation-instance-match-criteria"
              when AEC::FilterByDimension::ReservationUnusedFinancialOwner  then "reservation-unused-financial-owner"
              else
                raise Exception.new("unknown enum value for 'FilterByDimension' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FilterByDimension
      value = pull.read_string
      case value
      when "resource-region"                     then AEC::FilterByDimension::ResourceRegion
      when "availability-zone-id"                then AEC::FilterByDimension::AvailabilityZoneId
      when "account-id"                          then AEC::FilterByDimension::AccountId
      when "account-name"                        then AEC::FilterByDimension::AccountName
      when "instance-family"                     then AEC::FilterByDimension::InstanceFamily
      when "instance-type"                       then AEC::FilterByDimension::InstanceType
      when "instance-platform"                   then AEC::FilterByDimension::InstancePlatform
      when "reservation-arn"                     then AEC::FilterByDimension::ReservationArn
      when "reservation-id"                      then AEC::FilterByDimension::ReservationId
      when "reservation-type"                    then AEC::FilterByDimension::ReservationType
      when "reservation-create-timestamp"        then AEC::FilterByDimension::ReservationCreateTimestamp
      when "reservation-start-timestamp"         then AEC::FilterByDimension::ReservationStartTimestamp
      when "reservation-end-timestamp"           then AEC::FilterByDimension::ReservationEndTimestamp
      when "reservation-end-date-type"           then AEC::FilterByDimension::ReservationEndDateType
      when "tenancy"                             then AEC::FilterByDimension::Tenancy
      when "reservation-state"                   then AEC::FilterByDimension::ReservationState
      when "reservation-instance-match-criteria" then AEC::FilterByDimension::ReservationInstanceMatchCriteria
      when "reservation-unused-financial-owner"  then AEC::FilterByDimension::ReservationUnusedFinancialOwner
      else
        raise Exception.new("unknown enum value for 'FilterByDimension' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FilterByDimension::ResourceRegion                   then "resource-region"
      when AEC::FilterByDimension::AvailabilityZoneId               then "availability-zone-id"
      when AEC::FilterByDimension::AccountId                        then "account-id"
      when AEC::FilterByDimension::AccountName                      then "account-name"
      when AEC::FilterByDimension::InstanceFamily                   then "instance-family"
      when AEC::FilterByDimension::InstanceType                     then "instance-type"
      when AEC::FilterByDimension::InstancePlatform                 then "instance-platform"
      when AEC::FilterByDimension::ReservationArn                   then "reservation-arn"
      when AEC::FilterByDimension::ReservationId                    then "reservation-id"
      when AEC::FilterByDimension::ReservationType                  then "reservation-type"
      when AEC::FilterByDimension::ReservationCreateTimestamp       then "reservation-create-timestamp"
      when AEC::FilterByDimension::ReservationStartTimestamp        then "reservation-start-timestamp"
      when AEC::FilterByDimension::ReservationEndTimestamp          then "reservation-end-timestamp"
      when AEC::FilterByDimension::ReservationEndDateType           then "reservation-end-date-type"
      when AEC::FilterByDimension::Tenancy                          then "tenancy"
      when AEC::FilterByDimension::ReservationState                 then "reservation-state"
      when AEC::FilterByDimension::ReservationInstanceMatchCriteria then "reservation-instance-match-criteria"
      when AEC::FilterByDimension::ReservationUnusedFinancialOwner  then "reservation-unused-financial-owner"
      else
        raise Exception.new("unknown enum value for 'FilterByDimension' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FilterByDimension?
      case key
      when "resource-region"                     then AEC::FilterByDimension::ResourceRegion
      when "availability-zone-id"                then AEC::FilterByDimension::AvailabilityZoneId
      when "account-id"                          then AEC::FilterByDimension::AccountId
      when "account-name"                        then AEC::FilterByDimension::AccountName
      when "instance-family"                     then AEC::FilterByDimension::InstanceFamily
      when "instance-type"                       then AEC::FilterByDimension::InstanceType
      when "instance-platform"                   then AEC::FilterByDimension::InstancePlatform
      when "reservation-arn"                     then AEC::FilterByDimension::ReservationArn
      when "reservation-id"                      then AEC::FilterByDimension::ReservationId
      when "reservation-type"                    then AEC::FilterByDimension::ReservationType
      when "reservation-create-timestamp"        then AEC::FilterByDimension::ReservationCreateTimestamp
      when "reservation-start-timestamp"         then AEC::FilterByDimension::ReservationStartTimestamp
      when "reservation-end-timestamp"           then AEC::FilterByDimension::ReservationEndTimestamp
      when "reservation-end-date-type"           then AEC::FilterByDimension::ReservationEndDateType
      when "tenancy"                             then AEC::FilterByDimension::Tenancy
      when "reservation-state"                   then AEC::FilterByDimension::ReservationState
      when "reservation-instance-match-criteria" then AEC::FilterByDimension::ReservationInstanceMatchCriteria
      when "reservation-unused-financial-owner"  then AEC::FilterByDimension::ReservationUnusedFinancialOwner
      else
        nil
      end
    end
  end
end
