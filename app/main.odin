package main

import "core:fmt"

main :: proc() {
	{
		a := [3]f32{1, 2, 3}
		b := [3]f32{5, 6, 7}
		c := a * b
		d := a + b
		e := 1 +  (c - d) / 2
		fmt.printf("%.1f\n", e) // [0.5, 3.0, 6.5]
	}

	{
		a := [3]f32{1, 2, 3}
		b := swizzle(a, 2, 1, 0)
		assert(b == [3]f32{3, 2, 1})

		c := a.xx
		assert(c == [2]f32{1, 1})
		assert(c == 1)

		d := swizzle(a, 0, 0)
		assert(d == [2]f32{1, 1})
		assert(d == 1)
	}

	{
		Vector3 :: distinct [3]f32
		a := Vector3{1, 2, 3}
		b := Vector3{5, 6, 7}
		c := (a * b)/2 + 1
		d := c.x + c.y + c.z
		fmt.printf("%.1f\n", d) // 22.0

		cross :: proc(a, b: Vector3) -> Vector3 {
			i := a.yzx * b.zxy
			j := a.zxy * b.yzx
			return i - j
		}

		cross_explicit :: proc(a, b: Vector3) -> Vector3 {
			i := swizzle(a, 1, 2, 0) * swizzle(b, 2, 0, 1)
			j := swizzle(a, 2, 0, 1) * swizzle(b, 1, 2, 0)
			return i - j
		}

		blah :: proc(a: Vector3) -> f32 {
			return a.x + a.y + a.z
		}

		x := cross(a, b)
		fmt.println(x)
		fmt.println(blah(x))
	}
}
