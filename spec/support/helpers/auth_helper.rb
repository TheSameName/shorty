module AuthTestHelper

  def sign_in(account = nil)
    account ||= create(:account)

    post sign_in_path, params: { email: account.email, password: account.password }
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(Current)
      .to receive(:session).and_return(account.sessions.create!)
    # rubocop:enable RSpec/AnyInstance
  end
end

RSpec.configure do |config|
  config.include AuthTestHelper, type: :request
  config.include AuthTestHelper, type: :controller
end
