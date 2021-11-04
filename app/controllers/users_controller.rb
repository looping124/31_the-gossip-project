class UsersController < ApplicationController
  def index
  end

  def new
    Faker::Config.locale = 'fr'
    last_name_faker = Faker::Name.last_name
    @user = User.new(
      first_name:Faker::Name.first_name ,
      last_name:last_name_faker,
      description:Faker::Lorem.sentence(word_count: 5),
      email:"#{last_name_faker}@gmail.com",
      age:rand(18..60),
      city:City.all.sample,
      password: "password"
    )
  end

  def create
    user_params = params.require(:user).permit(:first_name,:last_name,:description,:email,:age,:city_id,:password)

    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @id=params[:id]
    @user = User.find_by(id: @id)
    @gossips_of_user = Gossip.where(user_id:@id).order('updated_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
