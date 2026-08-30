private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum StandardUnit
    Seconds
    Microseconds
    Milliseconds
    Bytes
    Kilobytes
    Megabytes
    Gigabytes
    Terabytes
    Bits
    Kilobits
    Megabits
    Gigabits
    Terabits
    Percent
    Count
    BytesSecond
    KilobytesSecond
    MegabytesSecond
    GigabytesSecond
    TerabytesSecond
    BitsSecond
    KilobitsSecond
    MegabitsSecond
    GigabitsSecond
    TerabitsSecond
    CountSecond
    None

    def self.to_json(e : StandardUnit, json : JSON::Builder) : Nil
      value = case e
              when ACWL::StandardUnit::Seconds         then "Seconds"
              when ACWL::StandardUnit::Microseconds    then "Microseconds"
              when ACWL::StandardUnit::Milliseconds    then "Milliseconds"
              when ACWL::StandardUnit::Bytes           then "Bytes"
              when ACWL::StandardUnit::Kilobytes       then "Kilobytes"
              when ACWL::StandardUnit::Megabytes       then "Megabytes"
              when ACWL::StandardUnit::Gigabytes       then "Gigabytes"
              when ACWL::StandardUnit::Terabytes       then "Terabytes"
              when ACWL::StandardUnit::Bits            then "Bits"
              when ACWL::StandardUnit::Kilobits        then "Kilobits"
              when ACWL::StandardUnit::Megabits        then "Megabits"
              when ACWL::StandardUnit::Gigabits        then "Gigabits"
              when ACWL::StandardUnit::Terabits        then "Terabits"
              when ACWL::StandardUnit::Percent         then "Percent"
              when ACWL::StandardUnit::Count           then "Count"
              when ACWL::StandardUnit::BytesSecond     then "Bytes/Second"
              when ACWL::StandardUnit::KilobytesSecond then "Kilobytes/Second"
              when ACWL::StandardUnit::MegabytesSecond then "Megabytes/Second"
              when ACWL::StandardUnit::GigabytesSecond then "Gigabytes/Second"
              when ACWL::StandardUnit::TerabytesSecond then "Terabytes/Second"
              when ACWL::StandardUnit::BitsSecond      then "Bits/Second"
              when ACWL::StandardUnit::KilobitsSecond  then "Kilobits/Second"
              when ACWL::StandardUnit::MegabitsSecond  then "Megabits/Second"
              when ACWL::StandardUnit::GigabitsSecond  then "Gigabits/Second"
              when ACWL::StandardUnit::TerabitsSecond  then "Terabits/Second"
              when ACWL::StandardUnit::CountSecond     then "Count/Second"
              when ACWL::StandardUnit::None            then "None"
              else
                raise Exception.new("unknown enum value for 'StandardUnit' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::StandardUnit
      value = pull.read_string
      case value
      when "Seconds"          then ACWL::StandardUnit::Seconds
      when "Microseconds"     then ACWL::StandardUnit::Microseconds
      when "Milliseconds"     then ACWL::StandardUnit::Milliseconds
      when "Bytes"            then ACWL::StandardUnit::Bytes
      when "Kilobytes"        then ACWL::StandardUnit::Kilobytes
      when "Megabytes"        then ACWL::StandardUnit::Megabytes
      when "Gigabytes"        then ACWL::StandardUnit::Gigabytes
      when "Terabytes"        then ACWL::StandardUnit::Terabytes
      when "Bits"             then ACWL::StandardUnit::Bits
      when "Kilobits"         then ACWL::StandardUnit::Kilobits
      when "Megabits"         then ACWL::StandardUnit::Megabits
      when "Gigabits"         then ACWL::StandardUnit::Gigabits
      when "Terabits"         then ACWL::StandardUnit::Terabits
      when "Percent"          then ACWL::StandardUnit::Percent
      when "Count"            then ACWL::StandardUnit::Count
      when "Bytes/Second"     then ACWL::StandardUnit::BytesSecond
      when "Kilobytes/Second" then ACWL::StandardUnit::KilobytesSecond
      when "Megabytes/Second" then ACWL::StandardUnit::MegabytesSecond
      when "Gigabytes/Second" then ACWL::StandardUnit::GigabytesSecond
      when "Terabytes/Second" then ACWL::StandardUnit::TerabytesSecond
      when "Bits/Second"      then ACWL::StandardUnit::BitsSecond
      when "Kilobits/Second"  then ACWL::StandardUnit::KilobitsSecond
      when "Megabits/Second"  then ACWL::StandardUnit::MegabitsSecond
      when "Gigabits/Second"  then ACWL::StandardUnit::GigabitsSecond
      when "Terabits/Second"  then ACWL::StandardUnit::TerabitsSecond
      when "Count/Second"     then ACWL::StandardUnit::CountSecond
      when "None"             then ACWL::StandardUnit::None
      else
        raise Exception.new("unknown enum value for 'StandardUnit' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::StandardUnit::Seconds         then "Seconds"
      when ACWL::StandardUnit::Microseconds    then "Microseconds"
      when ACWL::StandardUnit::Milliseconds    then "Milliseconds"
      when ACWL::StandardUnit::Bytes           then "Bytes"
      when ACWL::StandardUnit::Kilobytes       then "Kilobytes"
      when ACWL::StandardUnit::Megabytes       then "Megabytes"
      when ACWL::StandardUnit::Gigabytes       then "Gigabytes"
      when ACWL::StandardUnit::Terabytes       then "Terabytes"
      when ACWL::StandardUnit::Bits            then "Bits"
      when ACWL::StandardUnit::Kilobits        then "Kilobits"
      when ACWL::StandardUnit::Megabits        then "Megabits"
      when ACWL::StandardUnit::Gigabits        then "Gigabits"
      when ACWL::StandardUnit::Terabits        then "Terabits"
      when ACWL::StandardUnit::Percent         then "Percent"
      when ACWL::StandardUnit::Count           then "Count"
      when ACWL::StandardUnit::BytesSecond     then "Bytes/Second"
      when ACWL::StandardUnit::KilobytesSecond then "Kilobytes/Second"
      when ACWL::StandardUnit::MegabytesSecond then "Megabytes/Second"
      when ACWL::StandardUnit::GigabytesSecond then "Gigabytes/Second"
      when ACWL::StandardUnit::TerabytesSecond then "Terabytes/Second"
      when ACWL::StandardUnit::BitsSecond      then "Bits/Second"
      when ACWL::StandardUnit::KilobitsSecond  then "Kilobits/Second"
      when ACWL::StandardUnit::MegabitsSecond  then "Megabits/Second"
      when ACWL::StandardUnit::GigabitsSecond  then "Gigabits/Second"
      when ACWL::StandardUnit::TerabitsSecond  then "Terabits/Second"
      when ACWL::StandardUnit::CountSecond     then "Count/Second"
      when ACWL::StandardUnit::None            then "None"
      else
        raise Exception.new("unknown enum value for 'StandardUnit' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::StandardUnit?
      case key
      when "Seconds"          then ACWL::StandardUnit::Seconds
      when "Microseconds"     then ACWL::StandardUnit::Microseconds
      when "Milliseconds"     then ACWL::StandardUnit::Milliseconds
      when "Bytes"            then ACWL::StandardUnit::Bytes
      when "Kilobytes"        then ACWL::StandardUnit::Kilobytes
      when "Megabytes"        then ACWL::StandardUnit::Megabytes
      when "Gigabytes"        then ACWL::StandardUnit::Gigabytes
      when "Terabytes"        then ACWL::StandardUnit::Terabytes
      when "Bits"             then ACWL::StandardUnit::Bits
      when "Kilobits"         then ACWL::StandardUnit::Kilobits
      when "Megabits"         then ACWL::StandardUnit::Megabits
      when "Gigabits"         then ACWL::StandardUnit::Gigabits
      when "Terabits"         then ACWL::StandardUnit::Terabits
      when "Percent"          then ACWL::StandardUnit::Percent
      when "Count"            then ACWL::StandardUnit::Count
      when "Bytes/Second"     then ACWL::StandardUnit::BytesSecond
      when "Kilobytes/Second" then ACWL::StandardUnit::KilobytesSecond
      when "Megabytes/Second" then ACWL::StandardUnit::MegabytesSecond
      when "Gigabytes/Second" then ACWL::StandardUnit::GigabytesSecond
      when "Terabytes/Second" then ACWL::StandardUnit::TerabytesSecond
      when "Bits/Second"      then ACWL::StandardUnit::BitsSecond
      when "Kilobits/Second"  then ACWL::StandardUnit::KilobitsSecond
      when "Megabits/Second"  then ACWL::StandardUnit::MegabitsSecond
      when "Gigabits/Second"  then ACWL::StandardUnit::GigabitsSecond
      when "Terabits/Second"  then ACWL::StandardUnit::TerabitsSecond
      when "Count/Second"     then ACWL::StandardUnit::CountSecond
      when "None"             then ACWL::StandardUnit::None
      else
        nil
      end
    end
  end
end
