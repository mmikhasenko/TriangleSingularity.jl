function det_bruteforce(A::Matrix)
    n = size(A, 1)
    if n == 1
        return A[1, 1]
    elseif n == 2
        return A[1, 1] * A[2, 2] - A[1, 2] * A[2, 1]
    else
        det = 0.0
        for i = 1:n
            submatrix = A[2:end, [1:i-1; i+1:end]]
            det += (-1)^(i+1) * A[1, i] * det_bruteforce(submatrix)
        end
        return det
    end
end

"""
    landau_determinant(m1², m2², m3², M1², M2², M3²)

Compute the Landau determinant for a scalar triangle loop function.
The expression is given by `det [ki kj]`

Notaions:
```text
              o --- M₂
          m₁ / \\
            /   \\ m₃
    M₃ --- o --- o --- M₁
              m₂
```
"""
function landau_determinant(m1², m2², m3², M1², M2², M3²)
	k1sq = m1²
	k2sq = m2²
	k3sq = m3²
	k1k2 = (m1² + m2² - M3²)/2
	k1k3 = (m1² + m3² - M2²)/2
	k2k3 = (m2² + m3² - M1²)/2
	M = [
		k1sq k1k2 k1k3
		k1k2 k2sq k2k3
		k1k3 k2k3 k3sq
	]
	return det_bruteforce(M)
end
