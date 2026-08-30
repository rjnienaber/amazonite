module Amazonite::Core
  # One source in `Config`'s dynamic credentials provider chain (see
  # `Config#build_provider_chain`) - AssumeRole, SSO, ECS container, and
  # EC2 instance metadata each implement this.
  abstract class CredentialsProvider
    # returns nil when this provider's prerequisite configuration isn't
    # present, so the chain falls through to the next provider
    abstract def credentials : Credentials?
  end
end
