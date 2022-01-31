require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:address) }

    context 'Brithday' do
      it { should validate_presence_of(:birthday) }
      it { should_not allow_value('321564').for(:birthday) }
      it { should_not allow_value('ADSDSF5464').for(:birthday) }
      it { should_not allow_value('SDK;lkjsd07980987').for(:birthday) }
      it { should allow_value('2021/02/02').for(:birthday) }
      it { should allow_value('2021-02-02').for(:birthday) }
    end

    it { should validate_presence_of(:credit_card) }

    context 'Email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value('algo.com').for(:email) }
      it { should_not allow_value('@prueba.com').for(:email) }
      it { should_not allow_value('prueba.prueba.com').for(:email) }
      it { should allow_value('prueba@prueba.com').for(:email) }
      it { should allow_value('prueba12355443@prueba.com').for(:email) }
      it { should allow_value('prueba.ejemplo@prueba.com').for(:email) }
      it { should allow_value('prueba_ejemplo@prueba.com').for(:email) }
    end

    it { should validate_presence_of(:franchise) }

    context 'Name' do
      it { should validate_presence_of(:name) }
      it { should_not allow_value('a').for(:name) }
      it { should_not allow_value('a2').for(:name) }
      it { should_not allow_value('Andy Whinehows4').for(:name) }
      it { should_not allow_value('a' * 256).for(:name) }
      it { should_not allow_value('Charles *(&^(*&hjhghjgjkh))').for(:name) }
      it { should allow_value('John Doe').for(:name) }
      it { should allow_value('Robert-Lawrence').for(:name) }
    end

    context 'Telephone' do
      it { should validate_presence_of(:phone) }
      it { should_not allow_value('3106180000').for(:phone) }
      it { should_not allow_value('+573106180000').for(:phone) }
      it { should_not allow_value('(+57)3106180000').for(:phone) }
      it { should_not allow_value('(+57)310 6180000').for(:phone) }
      it { should_not allow_value('(+57)310 618 0000').for(:phone) }
      it { should_not allow_value('(+57) 310 618 0000').for(:phone) }
      it { should_not allow_value('(+57) 31O 618 00 00').for(:phone) }
      it { should_not allow_value('(+57) 310 618 00 A4').for(:phone) }
      it { should allow_value('(+57) 310 618 00 00').for(:phone) }
      it { should allow_value('(+57) 310 618 00 00 00').for(:phone) }
    end


  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
