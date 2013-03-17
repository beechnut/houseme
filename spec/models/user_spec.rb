require 'spec_helper'

describe User do
  
  before do
    @user = User.new(name: "Matt Cloyd", email: "cloydster@gmail.com",
                     password: "password", password_confirmation: "password")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should respond_to(:mobile) }
  it { should respond_to(:carrier) }
  it { should respond_to(:receive_text) }
  
  it { should respond_to(:active) }
  it { should respond_to(:last_search) }

  it { should be_valid }

  
  describe "when mobile number is missing" do
    before { @user.mobile = " " }
    describe "with a valid carrier" do
      before { @user.carrier = "Verizon" }
      it { should_not be_valid }
    end
  end

  describe "when using a valid mobile number" do
    before { @user.mobile = "5087692973" }
    describe "without a carrier" do
      before { @user.carrier = " " }
      it { should_not be_valid }
    end
  end

  # this test should be nested where the number has been set
  describe "when carrier is invalid" do

    before { @user.mobile = 1234567890 }

    it "should be invalid" do
      invalid_carriers = %w[Bell AirTouch Trillium Stromberg-Carlson]
      invalid_carriers.each do |invalid_carrier|
        @user.carrier = invalid_carrier
        @user.should_not be_valid
      end      
    end
  end

  describe "when carrier is valid" do
    before { @user.mobile = 1234567890 } # so it doesn't alert to a blank number
    it "should be valid" do
      valid_carriers = %w[Alltel AT&T Sprint T-Mobile Verizon]
      valid_carriers.each do |valid_carrier|
        @user.carrier = valid_carrier
        @user.should be_valid
      end
    end
  end
  # end

  # these tests should be moved to where the carrier is set
  describe "when number is too short" do
    before do
      @user.mobile = 123456789
      @user.carrier = "AT&T"
    end
    it { should_not be_valid }
  end

  describe "when number is too long" do
    before do
      @user.mobile = 12345678901
      @user.carrier = "AT&T"
    end
    it { should_not be_valid }
  end

  describe "when number is correct length" do
    before do
      @user.mobile = 1234567890
      @user.carrier = "AT&T"
    end
    it { should be_valid }
  end
  # end block

  describe "if user wants to receive texts" do
    before { @user.receive_text = true }
    
    describe "and has carrier and mobile number information" do
      before do
        @user.mobile = 1234567890
        @user.carrier = "Verizon"
      end
      it { should be_valid }
    end

    describe "with invalid information" do

      describe "without a mobile number" do
        before { @user.mobile = " " }
        it { should_not be_valid }
      end

      describe "without a carrier" do
        before { @user.carrier = " " }
        it { should_not be_valid }
      end
    end
  end

  ### ^ Specific to app ^   v User (mhartl) v


  describe "when name is missing" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is missing" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
      before { @user.password = "a" * 5 }
      it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email @user.email }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate "wrongpassword" }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

end
