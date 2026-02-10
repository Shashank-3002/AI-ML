C      Tetra Cone
       real jn, Re, Ri,Ec, theta, enn, eps, p1, p2, p3, p4,pi,
     1  skfx, httr, kf, knf, khnf, L1, L2, L3, L4, L5, L6,Mhd,
     1 ktethnf, kthnf, k1, k2, k3, k4
       dimension w(2,1801),af(1801),v1(1801), v2(1801),ww1(2,1801),
     1 aff(1801),bf(1801),an(2,2),bn(2,2),cn(2,2),a(2,2),
     1 b(2),jn(2,1801),en(2,2,1801),dn(2),eta(1801),f(2,2),qq(5),ee(4)
       open(1,file='Fig.4(6).out',status='new')
       data xx,h,dx/5.0,0.01,0.01/
       m0  = 9999
       Pr  = 7.0
       Re  = 10.0
       Ri  = 10.0
       Ec  = 0.09
       Mhd = 1.0
       eps = 0.1
       em = 0.5
       p1  = 0.025
       p2  = 0.025
       p3  = 0.025
       p4  = 0.025
       enn = 5.0
       pi = 3.14285714286
C      INITIAL PROFILES
       n = 2
       ni = int(xx/h)
       n0 = ni + 1
       fxi = 0.0
       gxi = 0.0
       xi = 0.0
       do 3 i=1,n0
       x = 0.0
       eta(i)=xi
       af(i) = (1.0 - eps*sin(enn*x*x))*(exp(-eta(i))- 1.0) + eta(i)
       w(1,i)= (eps*sin(enn*x*x) - 1.0)*exp(-eta(i)) + 1.0
       v1(i)  = - (eps*sin(enn*x*x) - 1.0)*exp(-eta(i))
       w(2,i) = exp(-eta(i))
       v2(i)  = - exp(-eta(i))
       aff(i) = 0.0
       ww1(1,i) = 0.0
       ww1(2,i) = 0.0
       xi = xi + h
  3    continue
       x = 0.0
       do 4 i=1,2
       dn(i) = 0.0
       jn(i,1) = w(i,1)
       jn(i,n0) = w(i,n0)
       jn(1,n0)= 1.0
       jn(2,n0)= 0.0
       do 4 j=1,5
       an(i,j) = 0.0
       bn(i,j) = 0.0
       cn(i,j) = 0.0
       en(i,j,1) = 0.0
       en(i,j,n0) = 0.0
   4   continue
C      COMPUTATIONS STARTS WITH X DO LOOP
       do 300 m=1,m0
       if(x.ge.0.5)dx=0.01
C      if(x.ge.1.00)dx=0.0005
C       if(x.ge.1.35)dx=0.0001

C       L1 =  Mhu(tethnf)/Mhu(f)
        L1 = 1.0/(((1.0-p1)*(1.0-p2)*(1.0-p3)*(1.0-p4))**2.5)

C       L2  = (Bt)(tethnf)/(Bt)(f)
        Btf = 0.00026
        Bt1 = 0.0000197
        Bt2 = 0.000023
        Bt3 = 0.000016
        Bt4 = 0.0000165
        L2 = (1-p1)*((1-p2)*((1-p3)*((1-p4)+p4*Bt4/Btf)+p3*Bt3/Btf)
     1     +p2*Bt2/Btf)+(p1*Bt1/Btf)
     

C       L3  = (Sg)(tethnf)/(Sg)(f)
        Sgf = 0.0000055
        Sg1 = 63000000
        Sg2 = 35000000
        Sg3 = 41000000
        Sg4 = 59600000

        Sgnf=Sgf*((Sg1+2*Sgf-2.0*p1*(Sgf-Sg1))/(Sg1+2*Sgf+p1*(Sgf-Sg1)))
        Sghnf=Sgnf*((Sg2+2*Sgnf-2.0*p2*(Sgnf-Sg2))
     1        /(Sg2+2*Sgnf-p2*(Sgnf-Sg2)))
        Sgthnf=Sghnf*((Sg3+2*Sghnf-2.0*p3*(Sghnf-Sg3))
     1   /(Sg3+2*Sghnf-p3*(Sghnf-Sg3)))
        Sgtethnf=Sgthnf*((Sg4+2*Sgthnf-2.0*p4*(Sgthnf-Sg4))
     1   /(Sg4+2*Sgthnf-p4*(Sgthnf-Sg4)))
        L3 = Sgtethnf/Sgf
        
C       L4 = Rh(tethnf)/Rh(f)
        Rhf = 997.1
        Rh1 = 10500.0
        Rh2 = 2700.0
        Rh3 = 19300.0
        Rh4 = 8960.0
        L4 = (1-p1)*((1-p2)*((1-p3)*((1-p4)+p4*(Rh4/Rhf))+p3*(Rh3/Rhf))
     1       +p2*(Rh2/Rhf))+p1*(Rh1/Rhf)
     
C       L5 = k(tethnf)/k(f)
        s = 3.0
        kf = 0.613
        k1 = 429.0
        k2 = 205.0
        k3 = 315.0
        k4 = 400.0
        
        knf = kf*((k1+2*kf-(s-1)*p1*(kf-k1))/(k1+2*kf-p1*(kf-k1)))
        khnf = knf*((k2+2*knf-(s-1)*p2*(knf-k2))/(k2+2*knf-p2*(knf-k2)))
        kthnf = khnf*((k3+2*khnf-(s-1)*p3*(khnf-k3))
     1   /(k3+2*khnf-p3*(khnf-k3)))
        ktethnf = kthnf*((k4+2*kthnf-(s-1)*p4*(kthnf-k4))
     1   /(k4+2*kthnf-p4*(kthnf-k4)))
        L5 = ktethnf/kf

C       L6  = (Rh*Cp)(tethnf)/(Rh*Cp)(f)
        Cpf = 4179.0
        Cp1 = 235.0
        Cp2 = 900.0
        Cp3 = 129.0
        Cp4 = 385.0
        L6  = (1-p1)*((1-p2)*((1-p3)*((1-p4)+p4*Rh4*Cp4/(Rhf*Cpf))
     1     +p3*Rh3*Cp3/(Rhf*Cpf))+p2*Rh2*Cp2/(Rhf*Cpf))
     1     +p1*Rh1*Cp1/(Rhf*Cpf)

       itrn = 0
    5  itrn = itrn + 1
       w(1,1)  = eps*sin(enn*x*x)
       w(2,1)  = 1.0
       w(1,n0) = 1.0
       w(2,n0) = 0.0
C       COMPUTATIONS STARTS WITH ETA DO LOOP
       do 6 i=2,ni
       i1 = i - 1
       i2 = i + 1
       v1(i) =  ( w(1,i2) - w(1,i1) )/ (2.0 * h)
       v2(i) =  ( w(2,i2) - w(2,i1) )/ (2.0 * h)
       if(m.eq.1)go to 51
       if(m.ne.1)go to 52
  51   continue
C      MATRIX COEFFICIENT FOR X=0
       df1= L4/L1
       df2= 2.0/(em + 1.0)
       df3= L3/L1
       df4= L6/L5
       a1 = df1*af(i)
       a2 = - df2*(df1*2.0*em*w(1,i)+ df3*Mhd*Re*sin(pi*x**2)**2)
       a3 = df1*L2*df2*Ri
       u1 = -df2*(df1*em*(1.0 + w(1,i)**2)+ df3*Mhd*Re*sin(pi*x**2)**2)
       b1 = Pr*df4*af(i)
       b2 = 2.0*df4*Pr*L1*Ec*v1(i)
       b3 = 2.0*df4*Pr*L3*Mhd*Re*Ec*sin(pi*x**2)**2*(w(1,i) - 1.0)
       u2 = df4*Pr*(L1*Ec*v1(i)**2 + L3*Mhd*Re*Ec*sin(pi*x**2)**2*
     1 (w(1,i)**2 - 1.0))
       an(1,1) = 1.0 - (a1*h/2.0)
       an(1,2) = 0.0
       an(2,1) = - b2*h/2.0
       an(2,2) = 1.0 - (b1*h/2.0)
       bn(1,1) = -2.0 + a2*h*h
       bn(1,2) = a3*h*h
       bn(2,1) = b3*h*h
       bn(2,2) = -2.0
       cn(1,1) = 1.0 + (a1*h/2.0)
       cn(1,2) = 0.0
       cn(2,1) = b2*h/2.0
       cn(2,2) = 1.0 + (b1*h/2.0)
       dn(1) = u1*h*h
       dn(2) = u2*h*h
       go to 255
  52   continue
C      MATRIX COEFFICIENTS FOR NON-ZERO X
        dxaf=(af(i)-aff(i))/dx
        dxf=(w(1,i)-ww1(1,i))/dx
        dxg=(w(2,i)-ww1(2,i))/dx
        df1= L4/L1
        df2= 2.0/(em + 1.0)
        df3= L3/L1
        df4= L6/L5
        df5= (em - 1.0)/(em + 1.0)
       a1 = df1*(af(i)- df5*x*dxaf)
       a2 = - df1*(2.0*df2*em*w(1,i)- df5*x*dxf)
     1 - df3*df2*Mhd*Re*sin(pi*x**2)**2
       a3 = df1*df5*x*w(1,i)
       a4 = df1*df2*L2*Ri
       u1 = - df1*(df2*em*(1.0 + w(1,i)**2) - df5*x*w(1,i)*dxf)
     1     - df2*df3*Re*Mhd*sin(pi*x**2)**2

       b1 = df4*Pr*(af(i)- df5*x*dxaf)
       b2 = df4*Pr*df5*x*w(1,i)
       b3 = 2.0*df4*L1*Pr*Ec*v1(i)
       b4 = Pr*df4*(df5*x*dxg + 2.0*L3*Mhd*Re*Ec*sin(pi*x**2)**2*
     1  (w(1,i)- 1.0))

       u2 = Pr*df4*(L1*Ec*v1(i)**2 + df5*x*dxg*w(1,i) +
     1  L3*Mhd*Re*Ec*sin(pi*x**2)**2*(w(1,i)**2- 1.0))
     
       an(1,1) = 1.0 - (a1*h/2)
       an(1,2) = 0.0
       an(2,1) = - b3*h/2
       an(2,2) = 1.0 - (b1*h/2)
       bn(1,1) = -2.0 + a2*h*h + a3*h*h/dx
       bn(1,2) = a4*h*h
       bn(2,1) = b4*h*h
       bn(2,2) = -2.0 + b2*h*h/dx
       cn(1,1) = 1.0 + (a1*h/2)
       cn(1,2) = 0.0
       cn(2,1) = b3*h/2
       cn(2,2) = 1.0 + (b1*h/2)
       dn(1) = u1 * h*h + (a3 * h*h/dx ) * ww1(1,i)
       dn(2) = u2 * h*h + (b2 * h*h/dx ) * ww1(2,i)
        go to 255
C      VARGA ALGORITHM
  255  do 7 j=1,2
       do 7 ll=1,2
       b(j)=0.0
       a(j,ll)=0.0
       do 7 k=1,2
       b(j) = b(j) + an(j,k) * jn(k,i1)
   7   a(j,ll) = a(j,ll) + an(j,k) * en(k,ll,i1)
       do 8 j=1,2
       b(j) = dn(j) - b(j)
       do 8 k=1,2
       a(j,k) = bn(j,k) - a(j,k)
   8   continue
       call humtum(a,n,qq,f)
       do 9 j=1,2
       do 9 ll=1,2
       jn(j,i)=0.0
       en(j,ll,i) = 0.0
       do 9 k=1,2
       jn(j,i) = jn(j,i) + f(j,k)*b(k)
       en(j,ll,i) = en(j,ll,i) + f(j,k)*cn(k,ll)
   9   continue
   6   continue
       do 10 i1=2,ni
       i= n0 - i1 + 1
       i2 = i + 1
       do 11 j=1,2
       w(j,i) = 0.0
       do 11 k=1,2
  11   w(j,i) = w(j,i) + en(j,k,i)*w(k,i2)
       do 12 j=1,2
  12   w(j,i) = jn(j,i) - w(j,i)
  10   continue
C      CALCULATIONS OF VELOCITY AND ENTHALPY GRADIENTS
       fx0=(-11.0*w(1,1)+18.0*w(1,2)-9.0*w(1,3)+2.0*w(1,4))/(h*6.0)
       gx0=(-11.0*w(2,1)+18.0*w(2,2)-9.0*w(2,3)+2.0*w(2,4))/(h*6.0)
       do 13 i=1,n0
   13  bf(i) = w(1,i)
       af(1) = 0.0
       af(2) = af(1)+(bf(1)+bf(2))*(h/2.0)
       do 14 i=3,n0
       i1 = i - 1
       i2 = i - 2
       af(i) = af(i2) + ( bf(i2) + 4.0* bf(i1) + bf(i) ) * h/3.0
  14   continue
C      TEST FOR CONVERGENCE
       c11 = abs(fxi - fx0)
       c12 = abs(gxi - gx0)
       c123 = amax1(c11,c12)
       if(c123.lt.0.0001)goto 15
       if(itrn.ge.80) goto 505
       fxi = fx0
       gxi = gx0
       go to 5
 15    continue
C       skfx =    L1*fx0/(4*(eps*(1.0+alpha*sin(enn*x*x))**2))
C       httr = - 0.5*L5*gx0
C       write(*,16)x,fx0
C       write(1,16)x,skfx
C       write(1,18)
C 16    format(4x,'',f9.3,2x,'',f9.5)
C       if( (abs(x - 0.00)).lt.0.0001)go to 555
       if( (abs(x - 1.0)).lt.0.0001)go to 555
C       if( (abs(x - 1.5)).lt.0.0001)go to 555
       go to 444
  555  write(1,997)
  997  format(4x,'ETA',7x,'F', 7x, 'G')
       do 17 j=1,n0,2
       write(*,19)eta(j),w(1,j), w(2,j)
       write(1,19)eta(j),w(1,j), w(2,j)
  19   format(2x,'',f9.5,2x,'',f9.5,2x,'',f9.5)
  17   continue
  444  do 45 i=1,n0
       aff(i) = af(i)
       ww1(1,i) = w(1,i)
       ww1(2,i) = w(2,i)
  45   continue
       if(abs(x).ge.4.0)go to 505
       x = x + dx
  300  continue
C       write(1,18)
C  18   format(2x,12(2x,'---'))
       write(*,61)
  61   format(30x,'PROGRAMM  IS  OVER')
C       write(1,18)
  505  stop
       end
C      SUBROUTINE  FOR  MATRIX INVERSE
        subroutine humtum(a,n,qq,f)
        real a(2,2),f(2,2),qq(5),ee(4)
        n = 2
        qq(1) = 1.0
        k = 1
        do 101 i=1,n
        do 101 j=1,n
  101   f(i,j) = a(i,j)
  106   qq(k+1) = 0.0
        do 102 i=1,n
  102   qq(k+1) = qq(k+1) + f(i,i)
        fk = k
        qq(k+1) = - qq(k+1) / fk
        do 112 i=1,n
  112   f(i,i) = f(i,i) + qq(k+1)
        if(k-n+1)104,105,104
  104   do 108 j=1,n
        do 111 l=1,n
  111   ee(l) = f(l,j)
        do 108 i=1,n
        f(i,j) = 0.0
        do 108 is=1,n
  108   f(i,j) = f(i,j) + a(i,is) * ee(is)
        k = k + 1
        go to 106
  105   qq(n+1) = 0.0
        do 107 j=1,n
  107   qq(n+1) = qq(n+1) - a(1,j) * f(j,1)
        if(qq(n+1))109,110,109
  109   do 208 i=1,n
        do 208 j=1,n
  208   f(i,j) = - f(i,j) / qq(n+1)
  110   return
        end

