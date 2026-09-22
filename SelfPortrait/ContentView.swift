//
//  ContentView.swift
//  SelfPortrait — 戴耳機的午後（Afternoon with Headphones）
//
//  以 SwiftUI 的基本形狀 + ZStack 堆疊出一張自畫像。
//  用到的形狀：Rectangle / Circle / Ellipse / Capsule /
//             RoundedRectangle / UnevenRoundedRectangle
//  顏色全部來自 Assets.xcassets，以 RGB 設定。
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            // MARK: - 全螢幕背景
            // 從 Assets 取色（Sky = RGB 168, 213, 224），延伸到安全區域外
            Color("Sky")
                .ignoresSafeArea()

            // 背後的柔光暈：用漸層讓背景不會太平
            Ellipse()
                .foregroundStyle(
                    Gradient(colors: [Color("Cloud"), Color("Sky")])
                )
                .frame(width: 560, height: 560)
                .opacity(0.45)
                .offset(y: -40)

            // 左上角的雲：兩顆 Capsule 疊出蓬鬆感
            Capsule()
                .foregroundStyle(Color("Cloud"))
                .frame(width: 150, height: 54)
                .opacity(0.9)
                .offset(x: -110, y: -320)
            Capsule()
                .foregroundStyle(Color("Cloud"))
                .frame(width: 90, height: 40)
                .opacity(0.75)
                .offset(x: -60, y: -345)

            // 右下角的雲
            Capsule()
                .foregroundStyle(Color("Cloud"))
                .frame(width: 120, height: 44)
                .opacity(0.7)
                .offset(x: 120, y: 300)

            // MARK: - 後方長髮
            // RoundedRectangle 圓角開大，變成披在肩上的長髮輪廓
            RoundedRectangle(cornerRadius: 150)
                .foregroundStyle(Color("Hair"))
                .frame(width: 318, height: 470)
                .offset(y: 40)
                .shadow(color: .black.opacity(0.22), radius: 14, y: 8)

            // MARK: - 脖子
            // Rectangle 加一點 brightness 壓暗，做出下巴的陰影
            Rectangle()
                .foregroundStyle(Color("Skin"))
                .brightness(-0.07)
                .frame(width: 78, height: 120)
                .offset(y: 185)

            // MARK: - 身體（毛衣）
            // UnevenRoundedRectangle：上緣圓、下緣方，做出肩膀的弧線
            UnevenRoundedRectangle(
                topLeadingRadius: 130,
                bottomLeadingRadius: 30,
                bottomTrailingRadius: 30,
                topTrailingRadius: 130
            )
            .foregroundStyle(
                Gradient(colors: [Color("Sweater"), Color("SweaterDark")])
            )
            .frame(width: 340, height: 330)
            .offset(y: 350)
            .shadow(color: .black.opacity(0.18), radius: 12, y: 6)

            // 領口：Ellipse 在毛衣上挖出一道弧線
            Ellipse()
                .foregroundStyle(Color("Sweater"))
                .brightness(-0.12)
                .frame(width: 112, height: 34)
                .offset(y: 186)

            // 落在胸前的兩束長髮：讓長髮蓋過肩膀
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 62, height: 300)
                .rotationEffect(.degrees(4))
                .offset(x: -126, y: 200)
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 62, height: 300)
                .rotationEffect(.degrees(-4))
                .offset(x: 126, y: 200)

            // MARK: - 耳朵
            Ellipse()
                .foregroundStyle(Color("Skin"))
                .brightness(-0.05)
                .frame(width: 36, height: 58)
                .offset(x: -108, y: 20)
            Ellipse()
                .foregroundStyle(Color("Skin"))
                .brightness(-0.05)
                .frame(width: 36, height: 58)
                .offset(x: 108, y: 20)

            // MARK: - 臉
            // Ellipse 比 Circle 更接近鵝蛋臉
            Ellipse()
                .foregroundStyle(Color("Skin"))
                .frame(width: 228, height: 276)
                .shadow(color: .black.opacity(0.12), radius: 8, y: 4)

            // MARK: - 瀏海
            // Ellipse 壓在額頭上，下緣自然彎成一道弧線
            Ellipse()
                .foregroundStyle(Color("Hair"))
                .frame(width: 252, height: 132)
                .offset(y: -126)

            // 側邊的髮絲：Capsule 轉個角度，讓瀏海不對稱
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 34, height: 150)
                .rotationEffect(.degrees(12))
                .offset(x: -104, y: -40)
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 34, height: 150)
                .rotationEffect(.degrees(-12))
                .offset(x: 104, y: -40)

            // MARK: - 眉毛
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 44, height: 9)
                .rotationEffect(.degrees(-7))
                .offset(x: -52, y: -46)
            Capsule()
                .foregroundStyle(Color("Hair"))
                .frame(width: 44, height: 9)
                .rotationEffect(.degrees(7))
                .offset(x: 52, y: -46)

            // MARK: - 眼睛
            Ellipse()
                .foregroundStyle(Color("Ink"))
                .frame(width: 22, height: 28)
                .offset(x: -52, y: -6)
            Ellipse()
                .foregroundStyle(Color("Ink"))
                .frame(width: 22, height: 28)
                .offset(x: 52, y: -6)

            // 眼睛的反光：小白點，眼神才不會死板
            Circle()
                .foregroundStyle(.white)
                .frame(width: 8)
                .offset(x: -56, y: -14)
            Circle()
                .foregroundStyle(.white)
                .frame(width: 8)
                .offset(x: 48, y: -14)

            // MARK: - 眼鏡
            // 用 stroke 只畫外框，Capsule 當鼻樑上的橫桿
            Circle()
                .stroke(Color("Ink"), lineWidth: 6)
                .frame(width: 84)
                .offset(x: -52, y: -6)
            Circle()
                .stroke(Color("Ink"), lineWidth: 6)
                .frame(width: 84)
                .offset(x: 52, y: -6)
            Capsule()
                .foregroundStyle(Color("Ink"))
                .frame(width: 26, height: 6)
                .offset(y: -6)

            // MARK: - 鼻子
            Capsule()
                .foregroundStyle(Color("Skin"))
                .brightness(-0.12)
                .frame(width: 11, height: 28)
                .offset(y: 40)

            // MARK: - 腮紅
            // 透明度壓低，只留一點紅暈
            Ellipse()
                .foregroundStyle(Color("Blush"))
                .frame(width: 48, height: 26)
                .opacity(0.45)
                .offset(x: -78, y: 52)
            Ellipse()
                .foregroundStyle(Color("Blush"))
                .frame(width: 48, height: 26)
                .opacity(0.45)
                .offset(x: 78, y: 52)

            // MARK: - 嘴巴
            Capsule()
                .foregroundStyle(Color("Sweater"))
                .brightness(-0.15)
                .frame(width: 46, height: 16)
                .offset(y: 88)

            // MARK: - 耳機頭帶
            // 一樣是 Circle 的一半，但改用 stroke，就變成跨過頭頂的弧線
            Circle()
                .trim(from: 0.5, to: 1.0)
                .stroke(Color("Ink"), lineWidth: 18)
                .frame(width: 286)
                .offset(y: -18)

            // MARK: - 耳罩
            Capsule()
                .foregroundStyle(Color("Ink"))
                .frame(width: 48, height: 92)
                .rotationEffect(.degrees(-4))
                .offset(x: -128, y: 12)
                .shadow(color: .black.opacity(0.25), radius: 6, x: -2, y: 4)
            Capsule()
                .foregroundStyle(Color("Ink"))
                .frame(width: 48, height: 92)
                .rotationEffect(.degrees(4))
                .offset(x: 128, y: 12)
                .shadow(color: .black.opacity(0.25), radius: 6, x: 2, y: 4)

            // 耳罩上的裝飾線：RoundedRectangle 小條，呼應毛衣的顏色
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(Color("Sweater"))
                .frame(width: 8, height: 40)
                .offset(x: -128, y: 12)
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(Color("Sweater"))
                .frame(width: 8, height: 40)
                .offset(x: 128, y: 12)
        }
    }
}

#Preview {
    ContentView()
}
