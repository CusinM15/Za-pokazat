def NarociVrcek(n):
    niz = ""
    try:
        n = int(n)
        if n < 0:
            print('Negativnega vrčka ni mogoče naročiti!')
        else:
            nad = ''
            vrc = (n + 1) * "*" + "\n"
            nad = u'\u23ba'
            prvi_z_rocm = "|" + nad + vrc
            z_rocem = "| " + vrc
            zadni_z_rocm = "|_" + vrc
            brez_vrca = "  " + vrc
            for i in range(n):
                if i == 0:
                    niz += prvi_z_rocm
                elif i < n - 2:
                    niz += z_rocem
                elif i == n - 2:
                    niz += zadni_z_rocm
                else:
                    niz += brez_vrca
            print(niz)
    except:
        print('Obvezno je da vnesete naravno število!')

n = input("Kako velik vrek bi naroili? ")
NarociVrcek(n)