require 'rails_helper'

RSpec.describe 'Consoles request' do
  describe 'GET /consoles' do
    it 'returns and array of video game consoles' do
      get('/consoles')
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Genesis',
        'Xbox',
        'Switch',
        'PS1',
        'PS2'
      )
    end
    it 'supports specifying consoles for a specific manufacture' do
      get('/consoles', params: {manufacturer: 'Nintendo'})
      
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Switch'
      )
    end
  end
end
