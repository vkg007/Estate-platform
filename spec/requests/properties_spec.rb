require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  describe 'GET #index' do
    before do
      get properties_path
    end
    it 'is expected to assign Properties instance variable' do
      expect(assigns[:properties]).to eq(User.find_by_id(1).properties)
    end
  end

  describe 'GET #new' do
    before do
      get new_property_path
    end
    it 'is expected to assign Property as new instance variable' do
      expect(assigns[:property]).to eq(User.find_by_id(1).properties.build)
    end
  end

  describe 'POST #create' do
    before do
      post properties_path, params: params
    end

    context 'when params are correct' do
      let(:params) { { property: { title: 'Bunglow 22 years new', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                   posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                   total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                   parking_area: 4780.0, description: 'Big lavish Bunglow',
                                   created_at: '2021-03-27 09:35:25.350819000 +0000',
                                   updated_at: '2021-03-27 09:35:25.350819000 +0000' } }
                     }

      it 'is expected to create new Property successfully' do
        expect(assigns[:property]).to be_instance_of(Property)
      end

      it 'is expected to redirect to Property path' do
        is_expected.to redirect_to new_property_address_path(property.id)
      end

      it 'is expected to set flash message' do
        expect(flash[:success] = 'Property details inserted successfully!')
      end
    end

    context 'when params are not correct' do
      let(:params) { { property: { title: ' ', built_area: '', user_id: '', carpet_area: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    before do
      get  edit_property_path(1)
    end

    context 'when Property id is valid' do
      let(:property) { Property.create(title: 'Bunglow 23 years new', built_area: 140_000, user_id: 1,
                                       carpet_area: 35_000.0,
                                       posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                       total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                       parking_area: 4780.0, description: 'Big lavish Bunglow',
                                       created_at: '2021-03-27 09:35:25.350819000 +0000',
                                       updated_at: '2021-03-27 09:35:25.350819000 +0000')
                       }
      let(:params) { { id: property.id } }

      it 'is expected to set Property instance variable' do
        expect(assigns[:Property]).to eq(Property.find_by(id: params[:id]))
      end

      it 'is expected to render edit template' do
        is_expected.to render_template(:edit)
      end
    end

    context 'when property id is invalid' do
      let(:params) { { id: 16 } }

      it 'is expected to redirect_to property path' do
        is_expected.to redirect_to(properties_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('Data not found')
      end
    end
  end

  describe 'PATCH #update' do
    before do
      property = Property.create(title: 'Bunglow 22 years new', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                 posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                 total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                 parking_area: 4780.0, description: 'Big lavish Bunglow',
                                 created_at: '2021-03-27 09:35:25.350819000 +0000',
                                 updated_at: '2021-03-27 09:35:25.350819000 +0000')
      patch properties_path(property.id), params: params
    end

    context 'when property exist in database' do
      let(:property) { Property.create(title: 'Bunglow 22 years new', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                       posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                       total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                       parking_area: 4780.0, description: 'Big lavish Bunglow',
                                       created_at: '2021-03-27 09:35:25.350819000 +0000',
                                       updated_at: '2021-03-27 09:35:25.350819000 +0000')
                       }

      let(:params) { { id: property.id, property: { title: 'Bunglow 22 years updated', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                                    posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                                    total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                                    parking_area: 4780.0, description: 'Big lavish Bunglow',
                                                    created_at: '2021-03-27 09:35:25.350819000 +0000',
                                                    updated_at: '2021-03-27 09:35:25.350819000 +0000' } }
                     }

      context 'when data is provided is valid' do
        it 'is expected to update Property' do
          expect(property.reload.title).to eq('Bunglow 22 years new')
        end

        it 'is expected to set flash message' do
          expect(flash[:success] = 'Property details Edited successfully.')
        end
      end

      context 'when data is invalid' do
        let(:property) { Property.create(title: nil, built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                         posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                         total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                         parking_area: 4780.0, description: 'Big lavish Bunglow',
                                         created_at: '2021-03-27 09:35:25.350819000 +0000',
                                         updated_at: '2021-03-27 09:35:25.350819000 +0000') }
        let(:params) { { id: property.id, property: { title: '', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                                      posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                                      total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                                      parking_area: 4780.0, description: 'Big lavish Bunglow',
                                                      created_at: '2021-03-27 09:35:25.350819000 +0000',
                                                      updated_at: '2021-03-27 09:35:25.350819000 +0000' } } }
        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to Property name attribute' do
          expect(assigns[:property].errors[:title]).to eq(["can't be blank"])
        end
      end
    end
  end

  describe 'Delete #destroy' do
    before do
      property = Property.create(title: 'Bunglow 22 years new', built_area: 140_000, user_id: 1, carpet_area: 35_000.0,
                                 posted_date: nil, available_for: 'bachelor', floor_no: 4, type_of: 'bunglow',
                                 total_floor: 4, age: '2021-03-28', bedrooms: 3, bathrooms: 5, balcony: 4,
                                 parking_area: 4780.0, description: 'Big lavish Bunglow',
                                 created_at: '2021-03-27 09:35:25.350819000 +0000',
                                 updated_at: '2021-03-27 09:35:25.350819000 +0000')
      delete Property.find(property.id)
    end

    it 'is expected to delete property record' do
      is_expected.to redirect_to(root_path)
    end
  end
end
