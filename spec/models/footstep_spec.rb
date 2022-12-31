require 'rails_helper'

# describeはtest対象を書く、今回はmodelのFootstep
RSpec.describe Footstep, type: :model do

  # describeはtest対象を書く
  describe 'favo?' do

    # let は テストで使用する変数を定義する
    # letしただけだと、データは使えない、beforeで呼んでおく必要がある
    let(:user) { User.create!(email: 'email@rails.com', password: '1111', password_confirmation: '1111') }
    let(:footstep) { Footstep.create!(footstep: 100, date: '2022-12-31', user: user) }

    # contextは前提条件を書く
    context 'userがFootstepにfavoしているとき' do
      # beforeはテスト前にしておく準備
      before do
        user
        footstep
        # favoのデータを作らないといけない
      end

      # it は 期待する結果を文字列で書く
      it 'favo?メソッドを実行したら、trueを返す' do
        # expectは()内で実行したときの期待結果をRubyで書く
        expect(footstep.favo?(user)).to eq true
      end
    end

    context 'userがFootstepにfavoしていないとき' do

      before do
        # favoしないパターン
      end

      it 'falseを返す' do
        expect(footstep.favo?(user)).to eq false
      end
    end
  end
end
