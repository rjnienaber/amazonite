private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum GroupBy
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

    def self.to_json(e : GroupBy, json : JSON::Builder) : Nil
      value = case e
              when AEC::GroupBy::ResourceRegion                   then "resource-region"
              when AEC::GroupBy::AvailabilityZoneId               then "availability-zone-id"
              when AEC::GroupBy::AccountId                        then "account-id"
              when AEC::GroupBy::AccountName                      then "account-name"
              when AEC::GroupBy::InstanceFamily                   then "instance-family"
              when AEC::GroupBy::InstanceType                     then "instance-type"
              when AEC::GroupBy::InstancePlatform                 then "instance-platform"
              when AEC::GroupBy::ReservationArn                   then "reservation-arn"
              when AEC::GroupBy::ReservationId                    then "reservation-id"
              when AEC::GroupBy::ReservationType                  then "reservation-type"
              when AEC::GroupBy::ReservationCreateTimestamp       then "reservation-create-timestamp"
              when AEC::GroupBy::ReservationStartTimestamp        then "reservation-start-timestamp"
              when AEC::GroupBy::ReservationEndTimestamp          then "reservation-end-timestamp"
              when AEC::GroupBy::ReservationEndDateType           then "reservation-end-date-type"
              when AEC::GroupBy::Tenancy                          then "tenancy"
              when AEC::GroupBy::ReservationState                 then "reservation-state"
              when AEC::GroupBy::ReservationInstanceMatchCriteria then "reservation-instance-match-criteria"
              when AEC::GroupBy::ReservationUnusedFinancialOwner  then "reservation-unused-financial-owner"
              else
                raise Exception.new("unknown enum value for 'GroupBy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::GroupBy
      value = pull.read_string
      case value
      when "resource-region"                     then AEC::GroupBy::ResourceRegion
      when "availability-zone-id"                then AEC::GroupBy::AvailabilityZoneId
      when "account-id"                          then AEC::GroupBy::AccountId
      when "account-name"                        then AEC::GroupBy::AccountName
      when "instance-family"                     then AEC::GroupBy::InstanceFamily
      when "instance-type"                       then AEC::GroupBy::InstanceType
      when "instance-platform"                   then AEC::GroupBy::InstancePlatform
      when "reservation-arn"                     then AEC::GroupBy::ReservationArn
      when "reservation-id"                      then AEC::GroupBy::ReservationId
      when "reservation-type"                    then AEC::GroupBy::ReservationType
      when "reservation-create-timestamp"        then AEC::GroupBy::ReservationCreateTimestamp
      when "reservation-start-timestamp"         then AEC::GroupBy::ReservationStartTimestamp
      when "reservation-end-timestamp"           then AEC::GroupBy::ReservationEndTimestamp
      when "reservation-end-date-type"           then AEC::GroupBy::ReservationEndDateType
      when "tenancy"                             then AEC::GroupBy::Tenancy
      when "reservation-state"                   then AEC::GroupBy::ReservationState
      when "reservation-instance-match-criteria" then AEC::GroupBy::ReservationInstanceMatchCriteria
      when "reservation-unused-financial-owner"  then AEC::GroupBy::ReservationUnusedFinancialOwner
      else
        raise Exception.new("unknown enum value for 'GroupBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::GroupBy::ResourceRegion                   then "resource-region"
      when AEC::GroupBy::AvailabilityZoneId               then "availability-zone-id"
      when AEC::GroupBy::AccountId                        then "account-id"
      when AEC::GroupBy::AccountName                      then "account-name"
      when AEC::GroupBy::InstanceFamily                   then "instance-family"
      when AEC::GroupBy::InstanceType                     then "instance-type"
      when AEC::GroupBy::InstancePlatform                 then "instance-platform"
      when AEC::GroupBy::ReservationArn                   then "reservation-arn"
      when AEC::GroupBy::ReservationId                    then "reservation-id"
      when AEC::GroupBy::ReservationType                  then "reservation-type"
      when AEC::GroupBy::ReservationCreateTimestamp       then "reservation-create-timestamp"
      when AEC::GroupBy::ReservationStartTimestamp        then "reservation-start-timestamp"
      when AEC::GroupBy::ReservationEndTimestamp          then "reservation-end-timestamp"
      when AEC::GroupBy::ReservationEndDateType           then "reservation-end-date-type"
      when AEC::GroupBy::Tenancy                          then "tenancy"
      when AEC::GroupBy::ReservationState                 then "reservation-state"
      when AEC::GroupBy::ReservationInstanceMatchCriteria then "reservation-instance-match-criteria"
      when AEC::GroupBy::ReservationUnusedFinancialOwner  then "reservation-unused-financial-owner"
      else
        raise Exception.new("unknown enum value for 'GroupBy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::GroupBy?
      case key
      when "resource-region"                     then AEC::GroupBy::ResourceRegion
      when "availability-zone-id"                then AEC::GroupBy::AvailabilityZoneId
      when "account-id"                          then AEC::GroupBy::AccountId
      when "account-name"                        then AEC::GroupBy::AccountName
      when "instance-family"                     then AEC::GroupBy::InstanceFamily
      when "instance-type"                       then AEC::GroupBy::InstanceType
      when "instance-platform"                   then AEC::GroupBy::InstancePlatform
      when "reservation-arn"                     then AEC::GroupBy::ReservationArn
      when "reservation-id"                      then AEC::GroupBy::ReservationId
      when "reservation-type"                    then AEC::GroupBy::ReservationType
      when "reservation-create-timestamp"        then AEC::GroupBy::ReservationCreateTimestamp
      when "reservation-start-timestamp"         then AEC::GroupBy::ReservationStartTimestamp
      when "reservation-end-timestamp"           then AEC::GroupBy::ReservationEndTimestamp
      when "reservation-end-date-type"           then AEC::GroupBy::ReservationEndDateType
      when "tenancy"                             then AEC::GroupBy::Tenancy
      when "reservation-state"                   then AEC::GroupBy::ReservationState
      when "reservation-instance-match-criteria" then AEC::GroupBy::ReservationInstanceMatchCriteria
      when "reservation-unused-financial-owner"  then AEC::GroupBy::ReservationUnusedFinancialOwner
      else
        nil
      end
    end
  end
end
