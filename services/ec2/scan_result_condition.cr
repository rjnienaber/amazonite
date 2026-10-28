private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Amazon Inspector scan-result criteria that an AMI must meet to be allowed. The criteria can
  # limit the highest finding severity. They can also limit, for each severity, the days since
  # Amazon Inspector reported a fix as available.
  #
  # The severity limit applies to all findings, whether or not a fix is available. The day limits
  # for each severity apply only to findings that have a fix available. A scanned AMI that has no
  # fix-available finding of a given severity meets that severity's day limit. AMIs that Amazon
  # Inspector has not scanned are not allowed when you specify this condition.
  class ScanResultCondition
    # The maximum number of days that have elapsed since Amazon Inspector last scanned the AMI. For
    # example, a value of `7` allows AMIs that were scanned within the last 7 days. AMIs that Amazon
    # Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_last_finding_scan : Int32 | Nil

    # The maximum severity that an AMI's Amazon Inspector findings can have for the AMI to be allowed.
    # Findings count whether or not a fix is available. For example, a value of `medium` allows AMIs
    # whose highest severity is `informational`, `low`, or `medium`.
    #
    # The valid values are the following Amazon Inspector severity levels, which correspond to CVSS
    # score ranges:
    #
    # - `informational` - CVSS score of 0.
    #
    # - `low` - CVSS score of 0.1 to 3.9.
    #
    # - `medium` - CVSS score of 4.0 to 6.9.
    #
    # - `high` - CVSS score of 7.0 to 8.9.
    #
    # - `critical` - CVSS score of 9.0 to 10.0.
    #
    # For more information, see [Software package vulnerability
    # severity](https://docs.aws.amazon.com/inspector/latest/user/findings-understanding-severity.html#findings-understanding-package-score)
    # in the *Amazon Inspector User Guide*.
    #
    # A scanned AMI that has no findings meets this limit.
    #
    # AMIs that Amazon Inspector has not scanned are not allowed when you specify this condition.
    property maximum_severity_label : SeverityLabel | Nil

    # The maximum number of days since Amazon Inspector reported a fix as available for an
    # `informational` severity finding on the AMI. For example, a value of `7` does not allow an AMI
    # if Amazon Inspector reported such a fix more than 7 days ago.
    #
    # A scanned AMI that has no `informational` severity finding with a fix available meets this
    # limit. AMIs that Amazon Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_informational_fix_available : Int32 | Nil

    # The maximum number of days since Amazon Inspector reported a fix as available for a `low`
    # severity finding on the AMI. For example, a value of `7` does not allow an AMI if Amazon
    # Inspector reported such a fix more than 7 days ago.
    #
    # A scanned AMI that has no `low` severity finding with a fix available meets this limit. AMIs
    # that Amazon Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_low_fix_available : Int32 | Nil

    # The maximum number of days since Amazon Inspector reported a fix as available for a `medium`
    # severity finding on the AMI. For example, a value of `7` does not allow an AMI if Amazon
    # Inspector reported such a fix more than 7 days ago.
    #
    # A scanned AMI that has no `medium` severity finding with a fix available meets this limit. AMIs
    # that Amazon Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_medium_fix_available : Int32 | Nil

    # The maximum number of days since Amazon Inspector reported a fix as available for a `high`
    # severity finding on the AMI. For example, a value of `7` does not allow an AMI if Amazon
    # Inspector reported such a fix more than 7 days ago.
    #
    # A scanned AMI that has no `high` severity finding with a fix available meets this limit. AMIs
    # that Amazon Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_high_fix_available : Int32 | Nil

    # The maximum number of days since Amazon Inspector reported a fix as available for a `critical`
    # severity finding on the AMI. For example, a value of `7` does not allow an AMI if Amazon
    # Inspector reported such a fix more than 7 days ago.
    #
    # A scanned AMI that has no `critical` severity finding with a fix available meets this limit.
    # AMIs that Amazon Inspector has not scanned are not allowed.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property max_days_since_critical_fix_available : Int32 | Nil

    def initialize(
      @max_days_since_last_finding_scan : Int32 | Nil = nil,
      @maximum_severity_label : SeverityLabel | Nil = nil,
      @max_days_since_informational_fix_available : Int32 | Nil = nil,
      @max_days_since_low_fix_available : Int32 | Nil = nil,
      @max_days_since_medium_fix_available : Int32 | Nil = nil,
      @max_days_since_high_fix_available : Int32 | Nil = nil,
      @max_days_since_critical_fix_available : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @max_days_since_last_finding_scan
        params << {"#{prefix}MaxDaysSinceLastFindingScan", value.to_s}
      end

      if value = @maximum_severity_label
        params << {"#{prefix}MaximumSeverityLabel", value.to_json_object_key}
      end

      if value = @max_days_since_informational_fix_available
        params << {"#{prefix}MaxDaysSinceInformationalFixAvailable", value.to_s}
      end

      if value = @max_days_since_low_fix_available
        params << {"#{prefix}MaxDaysSinceLowFixAvailable", value.to_s}
      end

      if value = @max_days_since_medium_fix_available
        params << {"#{prefix}MaxDaysSinceMediumFixAvailable", value.to_s}
      end

      if value = @max_days_since_high_fix_available
        params << {"#{prefix}MaxDaysSinceHighFixAvailable", value.to_s}
      end

      if value = @max_days_since_critical_fix_available
        params << {"#{prefix}MaxDaysSinceCriticalFixAvailable", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        max_days_since_last_finding_scan: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceLastFindingScan']")),
        maximum_severity_label: (n = node.xpath_node("*[local-name()='maximumSeverityLabel']")) ? AEC::SeverityLabel.from_json_object_key?(n.content) : nil,
        max_days_since_informational_fix_available: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceInformationalFixAvailable']")),
        max_days_since_low_fix_available: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceLowFixAvailable']")),
        max_days_since_medium_fix_available: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceMediumFixAvailable']")),
        max_days_since_high_fix_available: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceHighFixAvailable']")),
        max_days_since_critical_fix_available: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxDaysSinceCriticalFixAvailable']")),
      )
    end

    def validate! : Nil
      if value = @max_days_since_last_finding_scan
        raise Core::ValidationError.new("MaxDaysSinceLastFindingScan value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceLastFindingScan value must be <= 2147483647") if value > 2147483647
      end

      if value = @max_days_since_informational_fix_available
        raise Core::ValidationError.new("MaxDaysSinceInformationalFixAvailable value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceInformationalFixAvailable value must be <= 2147483647") if value > 2147483647
      end

      if value = @max_days_since_low_fix_available
        raise Core::ValidationError.new("MaxDaysSinceLowFixAvailable value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceLowFixAvailable value must be <= 2147483647") if value > 2147483647
      end

      if value = @max_days_since_medium_fix_available
        raise Core::ValidationError.new("MaxDaysSinceMediumFixAvailable value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceMediumFixAvailable value must be <= 2147483647") if value > 2147483647
      end

      if value = @max_days_since_high_fix_available
        raise Core::ValidationError.new("MaxDaysSinceHighFixAvailable value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceHighFixAvailable value must be <= 2147483647") if value > 2147483647
      end

      if value = @max_days_since_critical_fix_available
        raise Core::ValidationError.new("MaxDaysSinceCriticalFixAvailable value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDaysSinceCriticalFixAvailable value must be <= 2147483647") if value > 2147483647
      end
    end

    def_equals_and_hash(@max_days_since_last_finding_scan, @maximum_severity_label, @max_days_since_informational_fix_available, @max_days_since_low_fix_available, @max_days_since_medium_fix_available, @max_days_since_high_fix_available, @max_days_since_critical_fix_available)
  end
end
