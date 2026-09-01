private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum Runtime
    Nodejs
    Nodejs43
    Nodejs610
    Nodejs810
    Nodejs10X
    Nodejs12X
    Nodejs14X
    Nodejs16X
    Nodejs18X
    Nodejs20X
    Nodejs22X
    Nodejs24X
    Java8
    Java8Al2
    Java11
    Java17
    Java21
    Java25
    Python27
    Python36
    Python37
    Python38
    Python39
    Python310
    Python311
    Python312
    Python313
    Python314
    Dotnetcore10
    Dotnetcore20
    Dotnetcore21
    Dotnetcore31
    Dotnet6
    Dotnet8
    Dotnet10
    Nodejs43Edge
    Go1X
    Ruby25
    Ruby27
    Ruby32
    Ruby33
    Ruby34
    Ruby40
    Provided
    ProvidedAl2
    ProvidedAl2023
    Nodejs26X
    Python315
    Java8Al2023
    Java11Al2023
    Java17Al2023

    def self.to_json(e : Runtime, json : JSON::Builder) : Nil
      value = case e
              when AL::Runtime::Nodejs         then "nodejs"
              when AL::Runtime::Nodejs43       then "nodejs4.3"
              when AL::Runtime::Nodejs610      then "nodejs6.10"
              when AL::Runtime::Nodejs810      then "nodejs8.10"
              when AL::Runtime::Nodejs10X      then "nodejs10.x"
              when AL::Runtime::Nodejs12X      then "nodejs12.x"
              when AL::Runtime::Nodejs14X      then "nodejs14.x"
              when AL::Runtime::Nodejs16X      then "nodejs16.x"
              when AL::Runtime::Nodejs18X      then "nodejs18.x"
              when AL::Runtime::Nodejs20X      then "nodejs20.x"
              when AL::Runtime::Nodejs22X      then "nodejs22.x"
              when AL::Runtime::Nodejs24X      then "nodejs24.x"
              when AL::Runtime::Java8          then "java8"
              when AL::Runtime::Java8Al2       then "java8.al2"
              when AL::Runtime::Java11         then "java11"
              when AL::Runtime::Java17         then "java17"
              when AL::Runtime::Java21         then "java21"
              when AL::Runtime::Java25         then "java25"
              when AL::Runtime::Python27       then "python2.7"
              when AL::Runtime::Python36       then "python3.6"
              when AL::Runtime::Python37       then "python3.7"
              when AL::Runtime::Python38       then "python3.8"
              when AL::Runtime::Python39       then "python3.9"
              when AL::Runtime::Python310      then "python3.10"
              when AL::Runtime::Python311      then "python3.11"
              when AL::Runtime::Python312      then "python3.12"
              when AL::Runtime::Python313      then "python3.13"
              when AL::Runtime::Python314      then "python3.14"
              when AL::Runtime::Dotnetcore10   then "dotnetcore1.0"
              when AL::Runtime::Dotnetcore20   then "dotnetcore2.0"
              when AL::Runtime::Dotnetcore21   then "dotnetcore2.1"
              when AL::Runtime::Dotnetcore31   then "dotnetcore3.1"
              when AL::Runtime::Dotnet6        then "dotnet6"
              when AL::Runtime::Dotnet8        then "dotnet8"
              when AL::Runtime::Dotnet10       then "dotnet10"
              when AL::Runtime::Nodejs43Edge   then "nodejs4.3-edge"
              when AL::Runtime::Go1X           then "go1.x"
              when AL::Runtime::Ruby25         then "ruby2.5"
              when AL::Runtime::Ruby27         then "ruby2.7"
              when AL::Runtime::Ruby32         then "ruby3.2"
              when AL::Runtime::Ruby33         then "ruby3.3"
              when AL::Runtime::Ruby34         then "ruby3.4"
              when AL::Runtime::Ruby40         then "ruby4.0"
              when AL::Runtime::Provided       then "provided"
              when AL::Runtime::ProvidedAl2    then "provided.al2"
              when AL::Runtime::ProvidedAl2023 then "provided.al2023"
              when AL::Runtime::Nodejs26X      then "nodejs26.x"
              when AL::Runtime::Python315      then "python3.15"
              when AL::Runtime::Java8Al2023    then "java8.al2023"
              when AL::Runtime::Java11Al2023   then "java11.al2023"
              when AL::Runtime::Java17Al2023   then "java17.al2023"
              else
                raise Exception.new("unknown enum value for 'Runtime' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::Runtime
      value = pull.read_string
      case value
      when "nodejs"          then AL::Runtime::Nodejs
      when "nodejs4.3"       then AL::Runtime::Nodejs43
      when "nodejs6.10"      then AL::Runtime::Nodejs610
      when "nodejs8.10"      then AL::Runtime::Nodejs810
      when "nodejs10.x"      then AL::Runtime::Nodejs10X
      when "nodejs12.x"      then AL::Runtime::Nodejs12X
      when "nodejs14.x"      then AL::Runtime::Nodejs14X
      when "nodejs16.x"      then AL::Runtime::Nodejs16X
      when "nodejs18.x"      then AL::Runtime::Nodejs18X
      when "nodejs20.x"      then AL::Runtime::Nodejs20X
      when "nodejs22.x"      then AL::Runtime::Nodejs22X
      when "nodejs24.x"      then AL::Runtime::Nodejs24X
      when "java8"           then AL::Runtime::Java8
      when "java8.al2"       then AL::Runtime::Java8Al2
      when "java11"          then AL::Runtime::Java11
      when "java17"          then AL::Runtime::Java17
      when "java21"          then AL::Runtime::Java21
      when "java25"          then AL::Runtime::Java25
      when "python2.7"       then AL::Runtime::Python27
      when "python3.6"       then AL::Runtime::Python36
      when "python3.7"       then AL::Runtime::Python37
      when "python3.8"       then AL::Runtime::Python38
      when "python3.9"       then AL::Runtime::Python39
      when "python3.10"      then AL::Runtime::Python310
      when "python3.11"      then AL::Runtime::Python311
      when "python3.12"      then AL::Runtime::Python312
      when "python3.13"      then AL::Runtime::Python313
      when "python3.14"      then AL::Runtime::Python314
      when "dotnetcore1.0"   then AL::Runtime::Dotnetcore10
      when "dotnetcore2.0"   then AL::Runtime::Dotnetcore20
      when "dotnetcore2.1"   then AL::Runtime::Dotnetcore21
      when "dotnetcore3.1"   then AL::Runtime::Dotnetcore31
      when "dotnet6"         then AL::Runtime::Dotnet6
      when "dotnet8"         then AL::Runtime::Dotnet8
      when "dotnet10"        then AL::Runtime::Dotnet10
      when "nodejs4.3-edge"  then AL::Runtime::Nodejs43Edge
      when "go1.x"           then AL::Runtime::Go1X
      when "ruby2.5"         then AL::Runtime::Ruby25
      when "ruby2.7"         then AL::Runtime::Ruby27
      when "ruby3.2"         then AL::Runtime::Ruby32
      when "ruby3.3"         then AL::Runtime::Ruby33
      when "ruby3.4"         then AL::Runtime::Ruby34
      when "ruby4.0"         then AL::Runtime::Ruby40
      when "provided"        then AL::Runtime::Provided
      when "provided.al2"    then AL::Runtime::ProvidedAl2
      when "provided.al2023" then AL::Runtime::ProvidedAl2023
      when "nodejs26.x"      then AL::Runtime::Nodejs26X
      when "python3.15"      then AL::Runtime::Python315
      when "java8.al2023"    then AL::Runtime::Java8Al2023
      when "java11.al2023"   then AL::Runtime::Java11Al2023
      when "java17.al2023"   then AL::Runtime::Java17Al2023
      else
        raise Exception.new("unknown enum value for 'Runtime' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::Runtime::Nodejs         then "nodejs"
      when AL::Runtime::Nodejs43       then "nodejs4.3"
      when AL::Runtime::Nodejs610      then "nodejs6.10"
      when AL::Runtime::Nodejs810      then "nodejs8.10"
      when AL::Runtime::Nodejs10X      then "nodejs10.x"
      when AL::Runtime::Nodejs12X      then "nodejs12.x"
      when AL::Runtime::Nodejs14X      then "nodejs14.x"
      when AL::Runtime::Nodejs16X      then "nodejs16.x"
      when AL::Runtime::Nodejs18X      then "nodejs18.x"
      when AL::Runtime::Nodejs20X      then "nodejs20.x"
      when AL::Runtime::Nodejs22X      then "nodejs22.x"
      when AL::Runtime::Nodejs24X      then "nodejs24.x"
      when AL::Runtime::Java8          then "java8"
      when AL::Runtime::Java8Al2       then "java8.al2"
      when AL::Runtime::Java11         then "java11"
      when AL::Runtime::Java17         then "java17"
      when AL::Runtime::Java21         then "java21"
      when AL::Runtime::Java25         then "java25"
      when AL::Runtime::Python27       then "python2.7"
      when AL::Runtime::Python36       then "python3.6"
      when AL::Runtime::Python37       then "python3.7"
      when AL::Runtime::Python38       then "python3.8"
      when AL::Runtime::Python39       then "python3.9"
      when AL::Runtime::Python310      then "python3.10"
      when AL::Runtime::Python311      then "python3.11"
      when AL::Runtime::Python312      then "python3.12"
      when AL::Runtime::Python313      then "python3.13"
      when AL::Runtime::Python314      then "python3.14"
      when AL::Runtime::Dotnetcore10   then "dotnetcore1.0"
      when AL::Runtime::Dotnetcore20   then "dotnetcore2.0"
      when AL::Runtime::Dotnetcore21   then "dotnetcore2.1"
      when AL::Runtime::Dotnetcore31   then "dotnetcore3.1"
      when AL::Runtime::Dotnet6        then "dotnet6"
      when AL::Runtime::Dotnet8        then "dotnet8"
      when AL::Runtime::Dotnet10       then "dotnet10"
      when AL::Runtime::Nodejs43Edge   then "nodejs4.3-edge"
      when AL::Runtime::Go1X           then "go1.x"
      when AL::Runtime::Ruby25         then "ruby2.5"
      when AL::Runtime::Ruby27         then "ruby2.7"
      when AL::Runtime::Ruby32         then "ruby3.2"
      when AL::Runtime::Ruby33         then "ruby3.3"
      when AL::Runtime::Ruby34         then "ruby3.4"
      when AL::Runtime::Ruby40         then "ruby4.0"
      when AL::Runtime::Provided       then "provided"
      when AL::Runtime::ProvidedAl2    then "provided.al2"
      when AL::Runtime::ProvidedAl2023 then "provided.al2023"
      when AL::Runtime::Nodejs26X      then "nodejs26.x"
      when AL::Runtime::Python315      then "python3.15"
      when AL::Runtime::Java8Al2023    then "java8.al2023"
      when AL::Runtime::Java11Al2023   then "java11.al2023"
      when AL::Runtime::Java17Al2023   then "java17.al2023"
      else
        raise Exception.new("unknown enum value for 'Runtime' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::Runtime?
      case key
      when "nodejs"          then AL::Runtime::Nodejs
      when "nodejs4.3"       then AL::Runtime::Nodejs43
      when "nodejs6.10"      then AL::Runtime::Nodejs610
      when "nodejs8.10"      then AL::Runtime::Nodejs810
      when "nodejs10.x"      then AL::Runtime::Nodejs10X
      when "nodejs12.x"      then AL::Runtime::Nodejs12X
      when "nodejs14.x"      then AL::Runtime::Nodejs14X
      when "nodejs16.x"      then AL::Runtime::Nodejs16X
      when "nodejs18.x"      then AL::Runtime::Nodejs18X
      when "nodejs20.x"      then AL::Runtime::Nodejs20X
      when "nodejs22.x"      then AL::Runtime::Nodejs22X
      when "nodejs24.x"      then AL::Runtime::Nodejs24X
      when "java8"           then AL::Runtime::Java8
      when "java8.al2"       then AL::Runtime::Java8Al2
      when "java11"          then AL::Runtime::Java11
      when "java17"          then AL::Runtime::Java17
      when "java21"          then AL::Runtime::Java21
      when "java25"          then AL::Runtime::Java25
      when "python2.7"       then AL::Runtime::Python27
      when "python3.6"       then AL::Runtime::Python36
      when "python3.7"       then AL::Runtime::Python37
      when "python3.8"       then AL::Runtime::Python38
      when "python3.9"       then AL::Runtime::Python39
      when "python3.10"      then AL::Runtime::Python310
      when "python3.11"      then AL::Runtime::Python311
      when "python3.12"      then AL::Runtime::Python312
      when "python3.13"      then AL::Runtime::Python313
      when "python3.14"      then AL::Runtime::Python314
      when "dotnetcore1.0"   then AL::Runtime::Dotnetcore10
      when "dotnetcore2.0"   then AL::Runtime::Dotnetcore20
      when "dotnetcore2.1"   then AL::Runtime::Dotnetcore21
      when "dotnetcore3.1"   then AL::Runtime::Dotnetcore31
      when "dotnet6"         then AL::Runtime::Dotnet6
      when "dotnet8"         then AL::Runtime::Dotnet8
      when "dotnet10"        then AL::Runtime::Dotnet10
      when "nodejs4.3-edge"  then AL::Runtime::Nodejs43Edge
      when "go1.x"           then AL::Runtime::Go1X
      when "ruby2.5"         then AL::Runtime::Ruby25
      when "ruby2.7"         then AL::Runtime::Ruby27
      when "ruby3.2"         then AL::Runtime::Ruby32
      when "ruby3.3"         then AL::Runtime::Ruby33
      when "ruby3.4"         then AL::Runtime::Ruby34
      when "ruby4.0"         then AL::Runtime::Ruby40
      when "provided"        then AL::Runtime::Provided
      when "provided.al2"    then AL::Runtime::ProvidedAl2
      when "provided.al2023" then AL::Runtime::ProvidedAl2023
      when "nodejs26.x"      then AL::Runtime::Nodejs26X
      when "python3.15"      then AL::Runtime::Python315
      when "java8.al2023"    then AL::Runtime::Java8Al2023
      when "java11.al2023"   then AL::Runtime::Java11Al2023
      when "java17.al2023"   then AL::Runtime::Java17Al2023
      else
        nil
      end
    end
  end
end
