private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EC2 Fleet or Spot Fleet event.
  class EventInformation
    # The description of the event.
    property event_description : String | Nil

    # The event.
    #
    # `error` events:
    #
    # - `iamFleetRoleInvalid` - The EC2 Fleet or Spot Fleet does not have the required permissions
    # either to launch or terminate an instance.
    #
    # - `allLaunchSpecsTemporarilyBlacklisted` - None of the configurations are valid, and several
    # attempts to launch instances have failed. For more information, see the description of the
    # event.
    #
    # - `spotInstanceCountLimitExceeded` - You've reached the limit on the number of Spot Instances
    # that you can launch.
    #
    # - `spotFleetRequestConfigurationInvalid` - The configuration is not valid. For more information,
    # see the description of the event.
    #
    # `fleetRequestChange` events:
    #
    # - `active` - The EC2 Fleet or Spot Fleet request has been validated and Amazon EC2 is attempting
    # to maintain the target number of running instances.
    #
    # - `deleted` (EC2 Fleet) / `cancelled` (Spot Fleet) - The EC2 Fleet is deleted or the Spot Fleet
    # request is canceled and has no running instances. The EC2 Fleet or Spot Fleet will be deleted
    # two days after its instances are terminated.
    #
    # - `deleted_running` (EC2 Fleet) / `cancelled_running` (Spot Fleet) - The EC2 Fleet is deleted or
    # the Spot Fleet request is canceled and does not launch additional instances. Its existing
    # instances continue to run until they are interrupted or terminated. The request remains in this
    # state until all instances are interrupted or terminated.
    #
    # - `deleted_terminating` (EC2 Fleet) / `cancelled_terminating` (Spot Fleet) - The EC2 Fleet is
    # deleted or the Spot Fleet request is canceled and its instances are terminating. The request
    # remains in this state until all instances are terminated.
    #
    # - `expired` - The EC2 Fleet or Spot Fleet request has expired. If the request was created with
    # `TerminateInstancesWithExpiration` set, a subsequent `terminated` event indicates that the
    # instances are terminated.
    #
    # - `modify_in_progress` - The EC2 Fleet or Spot Fleet request is being modified. The request
    # remains in this state until the modification is fully processed.
    #
    # - `modify_succeeded` - The EC2 Fleet or Spot Fleet request was modified.
    #
    # - `submitted` - The EC2 Fleet or Spot Fleet request is being evaluated and Amazon EC2 is
    # preparing to launch the target number of instances.
    #
    # - `progress` - The EC2 Fleet or Spot Fleet request is in the process of being fulfilled.
    #
    # `instanceChange` events:
    #
    # - `launched` - A new instance was launched.
    #
    # - `terminated` - An instance was terminated by the user.
    #
    # - `termination_notified` - An instance termination notification was sent when a Spot Instance
    # was terminated by Amazon EC2 during scale-down, when the target capacity of the fleet was
    # modified down, for example, from a target capacity of 4 to a target capacity of 3.
    #
    # `Information` events:
    #
    # - `fleetProgressHalted` - The price in every launch specification is not valid because it is
    # below the Spot price (all the launch specifications have produced `launchSpecUnusable` events).
    # A launch specification might become valid if the Spot price changes.
    #
    # - `launchSpecTemporarilyBlacklisted` - The configuration is not valid and several attempts to
    # launch instances have failed. For more information, see the description of the event.
    #
    # - `launchSpecUnusable` - The price specified in a launch specification is not valid because it
    # is below the Spot price for the requested Spot pools.
    #
    # Note: Even if a fleet with the `maintain` request type is in the process of being canceled, it
    # may still publish a `launchSpecUnusable` event. This does not mean that the canceled fleet is
    # attempting to launch a new instance.
    #
    # - `registerWithLoadBalancersFailed` - An attempt to register instances with load balancers
    # failed. For more information, see the description of the event.
    property event_sub_type : String | Nil

    # The ID of the instance. This information is available only for `instanceChange` events.
    property instance_id : String | Nil

    def initialize(
      @event_description : String | Nil = nil,
      @event_sub_type : String | Nil = nil,
      @instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @event_description
        params << {"#{prefix}EventDescription", value}
      end

      if value = @event_sub_type
        params << {"#{prefix}EventSubType", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        event_description: Core::XMLValue.string(node.xpath_node("*[local-name()='eventDescription']")),
        event_sub_type: Core::XMLValue.string(node.xpath_node("*[local-name()='eventSubType']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@event_description, @event_sub_type, @instance_id)
  end
end
