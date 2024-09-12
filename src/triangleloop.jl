"""
    Isc(m1², m2², m3², M1², M2², M3²)
    Scalar triangle loop function
              o --- M₂
          m₁ / \\
            /   \\ m₃
    M₃ --- o --- o --- M₁
              m₂
"""
function triangleloop(m1², m2², m3², M1², M2², M3²)
    function integrand(x)
        A = M1²;
        B = m2² + x*M2² - (1-x)*M1² - x*M3²-m3²;
        C = x*m1² + (1-x)*m3² - x*(1-x)*M2²;
        D = B^2-4*A*C;
        y1, y2 = (-B .- sqrt(D) .* [1.0, -1.0]) ./ (2*A);
        return (log((1-x-y2)/(-y2))-log((1-x-y1)/(-y1)))/(A*(y2-y1))
    end
    integr = quadgk(integrand, 0, 1)[1];
    return integr/(16*π^2);
end