require 'rails_helper'

RSpec.describe 'Users', type: :request do

  # describe 'before actions' do
  #   describe 'find_user' do
  #     it 'is expected to define before action' do
  #        it { should use_before_action(:find_user) }
  #     end
  #   end
  # end

=begin
  describe 'GET new' do
    it 'assigns a new user as @user' do
      get new_user_path
      expect(assigns(:user)).to_not eq nil
      expect(assigns(:user)).to be_a_new(User)
    end
  end


  describe 'POST #create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do
      let(:params) { { user: { first_name: "vivek", last_name:'gupta', email: 'vkg@gmail.com', mobile: '7885588855', password: 'facfac',password_confirmation: 'dnswdbs', image: 'jdsbd' } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to redirect to users path' do
        is_expected.to redirect_to root_path
      end

      it 'is expected to set flash message' do
        expect(flash[:success] = 'You have successfully created an account!')
      end
    end

    context 'when params are not correct' do
      let(:params) { { user: { email: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end
    end
  end
  
  describe 'GET #edit' do
    before do
      # something that you want to execute before running `it` block
      get :edit, params: params
    end

    context 'when user id is valid' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id } }

      it 'is expected to set user instance variable' do
        expect(assigns[:user]).to eq(User.find_by(id: params[:id]))
      end

      it 'is expected to render edit template' do
        is_expected.to render_template(:edit)
      end
    end

    context 'when user id is invalid' do
      let(:params) { { id: Faker::Number.number } }

      it 'is expected to redirect_to users path' do
        is_expected.to redirect_to(users_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('User not found.')
      end
    end

  end


  # update action
  describe 'PATCH #update' do

    before do
      # something that you want to execute before running `it` block
      patch :update, params: params
    end

    context 'when user not found' do
      let(:params) { { id: Faker::Number.number } }

      it 'is expected to redirect_to users path' do
        is_expected.to redirect_to(users_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('User not found.')
      end
    end

    context 'when user exist in database' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id, user: { name: 'test name' } } }

      context 'when data is provided is valid' do
        it 'is expected to update user' do
          expect(user.reload.name).to eq('test name')
        end

        it 'is_expected to redirect_to users_path' do
          is_expected.to redirect_to(users_path)
        end

        it 'is expected to set flash message' do
          expect(flash[:notice]).to eq('User has been updated Successfully.')
        end
      end

      context 'when data is invalid' do
        let(:user) { FactoryBot.create :user }
        let(:params) { { id: user.id, user: { name: '' } } }

        it 'is expected not to update user name' do
          expect(user.reload.name).not_to be_empty
        end

        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to user name attribute' do
          expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
        end
      end
    end
  end

=end
end
