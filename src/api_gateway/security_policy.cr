private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum SecurityPolicy
    Tls10
    Tls12
    SecurityPolicyTls1313202509
    SecurityPolicyTls1313Fips202509
    SecurityPolicyTls1312PfsPq202509
    SecurityPolicyTls1312FipsPq202509
    SecurityPolicyTls1312FipsPfsPq202509
    SecurityPolicyTls1312Pq202509
    SecurityPolicyTls1312202106
    SecurityPolicyTls132025Edge
    SecurityPolicyTls12Pfs2025Edge
    SecurityPolicyTls122018Edge

    def self.to_json(e : SecurityPolicy, json : JSON::Builder) : Nil
      value = case e
              when AAG::SecurityPolicy::Tls10                                then "TLS_1_0"
              when AAG::SecurityPolicy::Tls12                                then "TLS_1_2"
              when AAG::SecurityPolicy::SecurityPolicyTls1313202509          then "SecurityPolicy_TLS13_1_3_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1313Fips202509      then "SecurityPolicy_TLS13_1_3_FIPS_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1312PfsPq202509     then "SecurityPolicy_TLS13_1_2_PFS_PQ_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1312FipsPq202509    then "SecurityPolicy_TLS13_1_2_FIPS_PQ_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1312FipsPfsPq202509 then "SecurityPolicy_TLS13_1_2_FIPS_PFS_PQ_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1312Pq202509        then "SecurityPolicy_TLS13_1_2_PQ_2025_09"
              when AAG::SecurityPolicy::SecurityPolicyTls1312202106          then "SecurityPolicy_TLS13_1_2_2021_06"
              when AAG::SecurityPolicy::SecurityPolicyTls132025Edge          then "SecurityPolicy_TLS13_2025_EDGE"
              when AAG::SecurityPolicy::SecurityPolicyTls12Pfs2025Edge       then "SecurityPolicy_TLS12_PFS_2025_EDGE"
              when AAG::SecurityPolicy::SecurityPolicyTls122018Edge          then "SecurityPolicy_TLS12_2018_EDGE"
              else
                raise Exception.new("unknown enum value for 'SecurityPolicy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::SecurityPolicy
      value = pull.read_string
      case value
      when "TLS_1_0"                                      then AAG::SecurityPolicy::Tls10
      when "TLS_1_2"                                      then AAG::SecurityPolicy::Tls12
      when "SecurityPolicy_TLS13_1_3_2025_09"             then AAG::SecurityPolicy::SecurityPolicyTls1313202509
      when "SecurityPolicy_TLS13_1_3_FIPS_2025_09"        then AAG::SecurityPolicy::SecurityPolicyTls1313Fips202509
      when "SecurityPolicy_TLS13_1_2_PFS_PQ_2025_09"      then AAG::SecurityPolicy::SecurityPolicyTls1312PfsPq202509
      when "SecurityPolicy_TLS13_1_2_FIPS_PQ_2025_09"     then AAG::SecurityPolicy::SecurityPolicyTls1312FipsPq202509
      when "SecurityPolicy_TLS13_1_2_FIPS_PFS_PQ_2025_09" then AAG::SecurityPolicy::SecurityPolicyTls1312FipsPfsPq202509
      when "SecurityPolicy_TLS13_1_2_PQ_2025_09"          then AAG::SecurityPolicy::SecurityPolicyTls1312Pq202509
      when "SecurityPolicy_TLS13_1_2_2021_06"             then AAG::SecurityPolicy::SecurityPolicyTls1312202106
      when "SecurityPolicy_TLS13_2025_EDGE"               then AAG::SecurityPolicy::SecurityPolicyTls132025Edge
      when "SecurityPolicy_TLS12_PFS_2025_EDGE"           then AAG::SecurityPolicy::SecurityPolicyTls12Pfs2025Edge
      when "SecurityPolicy_TLS12_2018_EDGE"               then AAG::SecurityPolicy::SecurityPolicyTls122018Edge
      else
        raise Exception.new("unknown enum value for 'SecurityPolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::SecurityPolicy::Tls10                                then "TLS_1_0"
      when AAG::SecurityPolicy::Tls12                                then "TLS_1_2"
      when AAG::SecurityPolicy::SecurityPolicyTls1313202509          then "SecurityPolicy_TLS13_1_3_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1313Fips202509      then "SecurityPolicy_TLS13_1_3_FIPS_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1312PfsPq202509     then "SecurityPolicy_TLS13_1_2_PFS_PQ_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1312FipsPq202509    then "SecurityPolicy_TLS13_1_2_FIPS_PQ_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1312FipsPfsPq202509 then "SecurityPolicy_TLS13_1_2_FIPS_PFS_PQ_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1312Pq202509        then "SecurityPolicy_TLS13_1_2_PQ_2025_09"
      when AAG::SecurityPolicy::SecurityPolicyTls1312202106          then "SecurityPolicy_TLS13_1_2_2021_06"
      when AAG::SecurityPolicy::SecurityPolicyTls132025Edge          then "SecurityPolicy_TLS13_2025_EDGE"
      when AAG::SecurityPolicy::SecurityPolicyTls12Pfs2025Edge       then "SecurityPolicy_TLS12_PFS_2025_EDGE"
      when AAG::SecurityPolicy::SecurityPolicyTls122018Edge          then "SecurityPolicy_TLS12_2018_EDGE"
      else
        raise Exception.new("unknown enum value for 'SecurityPolicy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::SecurityPolicy?
      case key
      when "TLS_1_0"                                      then AAG::SecurityPolicy::Tls10
      when "TLS_1_2"                                      then AAG::SecurityPolicy::Tls12
      when "SecurityPolicy_TLS13_1_3_2025_09"             then AAG::SecurityPolicy::SecurityPolicyTls1313202509
      when "SecurityPolicy_TLS13_1_3_FIPS_2025_09"        then AAG::SecurityPolicy::SecurityPolicyTls1313Fips202509
      when "SecurityPolicy_TLS13_1_2_PFS_PQ_2025_09"      then AAG::SecurityPolicy::SecurityPolicyTls1312PfsPq202509
      when "SecurityPolicy_TLS13_1_2_FIPS_PQ_2025_09"     then AAG::SecurityPolicy::SecurityPolicyTls1312FipsPq202509
      when "SecurityPolicy_TLS13_1_2_FIPS_PFS_PQ_2025_09" then AAG::SecurityPolicy::SecurityPolicyTls1312FipsPfsPq202509
      when "SecurityPolicy_TLS13_1_2_PQ_2025_09"          then AAG::SecurityPolicy::SecurityPolicyTls1312Pq202509
      when "SecurityPolicy_TLS13_1_2_2021_06"             then AAG::SecurityPolicy::SecurityPolicyTls1312202106
      when "SecurityPolicy_TLS13_2025_EDGE"               then AAG::SecurityPolicy::SecurityPolicyTls132025Edge
      when "SecurityPolicy_TLS12_PFS_2025_EDGE"           then AAG::SecurityPolicy::SecurityPolicyTls12Pfs2025Edge
      when "SecurityPolicy_TLS12_2018_EDGE"               then AAG::SecurityPolicy::SecurityPolicyTls122018Edge
      else
        nil
      end
    end
  end
end
