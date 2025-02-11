from copy import deepcopy


# dst   | enc           | src
#  1    | E1            | S1D, S12
#  2    | E1, E2        | S2D, 




def generate_comb(x, current=[[1],[2]]):
    if len(current[0]) == x: 
        return current
    else:
        next = []
        for i in current:
            next.append(i + [2])
            next.append(i + [1])
        return generate_comb(x,next)


def get_mask(dec_res):
    mask_res = deepcopy(dec_res)
    for i in range(0,len(mask_res)-1):
        if mask_res[i] == 2:
            mask_res[i+1] = 0
    #if mask_res[-1] != 0:
    #    mask_res[-1] = 1

    #if dec_res[-1] ==2:


    #start_ptr = sum(mask_res[0:current_channel]) 
    return mask_res
    #print(start_ptr)
    #print(mask_res)
    #print(comb)
    #print(comb[1])


def find_nth_non_zero(lst, n):
    non_zero_indices = [i for i, x in enumerate(lst) if x != 0]
    if len(non_zero_indices) < n:
        return None  # 如果非零值的数量少于N，则返回None
    return non_zero_indices[n-1]  # 返回第N个非零值的序号
 
# 示例
#lst = [0, 1, 2, 0, 3, 0, 4, 0, 5]
#n = 3
#index = find_nth_non_zero(lst, n)
#print(index)  # 输出: 3


CHANNEL_NUM = 8

if __name__ == "__main__":
    for analyze_channel in range(0,CHANNEL_NUM):
        print('===========================')
        print('Output Channel %s' % analyze_channel)

        comb = generate_comb(CHANNEL_NUM)
        for i in comb:
            mask_res = get_mask(i)

            start_ptr = find_nth_non_zero(mask_res,analyze_channel+1)
            

            #print(mask_res)
            #print(start_ptr)
            if start_ptr == None:

                select_res = "channel_DontCare"
            elif start_ptr > (CHANNEL_NUM-1):
                select_res = 'channel_DontCare'
            else:
                inst_is_32 = mask_res[start_ptr] 
                select_res = 'channel_DontCare'
                if inst_is_32 == 2:
                    if start_ptr == (CHANNEL_NUM-1):
                        select_res = 'channel_DontCare' 
                    else:
                        select_res = 'channel_%s_E' % start_ptr
                else:
                    select_res = 'channel_%s' % start_ptr

            print('%4s    %s    %s    %s   ' % (start_ptr, i, mask_res, select_res))

    #print('()')