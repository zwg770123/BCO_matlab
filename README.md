## Bezier Curve-based Optimization (BCO) 
![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)

Bezier curve-based optimization (BCO) is new optimizer which draws inspiration from Bezier curve theory. Drawing upon the geometric properties of different-order Bezier curves, BCO employs the linear Bezier curve to achieve exploitation, the quadratic Bezier curve to facilitate local optima avoidance, and the cubic Bezier curve to implement exploration. The algorithm is simple and easy to implement.



![image](bco_image.png)

📄Main paper (Open access): Zhao, W., Xie Y., Wang, L., Zhang. Z., Khodadadi, N., Mirjalili, S. (2026). An effective Bezier curve-based optimization (BCO) for large-scale numerical problems and 3D unmanned aerial vehicle path  planning with efficient multiple threats evasion, Advanced Engineering Informatics, 73, 104524. https://doi.org/10.1016/j.aei.2026.104524. 

📥You can download the main paper here (Open access): https://www.sciencedirect.com/science/article/pii/S1474034626002168

📝The main contributions of this study are:

1.  This study presents a comprehensive collection of 312 metaheuristic algorithms, drawing on contributions from multiple research teams. Analyzing this extensive set uncovers non-uniform evolutionary patterns within the field, which offers readers a complete overview and motivates the development of new mathematical algorithms.

2.  A new metaheuristic called BCO is proposed, inspired by the mathematical principles of Bezier curve theory. The optimization process is guided by Bezier curves of different orders, and an adaptive balance factor is introduced to dynamically maintain the trade-off between exploration and exploitation.

   3. Three curve-based operators are designed, including the linear Bezier curve to enhance exploitation, the quadratic Bezier curve to avoid local optima, and the cubic Bezier curve to boost exploration. These operators work in conjunction with the adaptive balance factor to improve search performance.

   4. BCO is evaluated on different benchmark functions and compared against 27 high-quality algorithms, including 6 well-known, 8 cutting-edge, 8 hybrid, and 5 CEC champion algorithms.

   5. The practical utility of BCO is validated through its successful application to 3D UAV path planning in eight terrain scenarios from two perspectives, with efficient evasion of multiple threats.
