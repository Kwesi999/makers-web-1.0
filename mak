'use client'

import { useState } from 'react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Textarea } from "@/components/ui/textarea"
import { Calendar } from "@/components/ui/calendar"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { format } from "date-fns"
import { CalendarIcon } from 'lucide-react'
import Link from 'next/link';

export default function QueryPage() {
  const [projectType, setProjectType] = useState('')
  const [date, setDate] = useState<Date>()

  const projectPrices: { [key: string]: number } = {
    'Masters Thesis': 4000,
    'Undergrad Project Work': 3000,
    'Data Analysis': 1000,
    'Graphic Design': 500
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-center mb-8">
          <svg className="h-10 w-10 mr-2" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="40" height="40" rx="8" fill="#4A90E2"/>
            <path d="M10 25L20 10L30 25M13 22L20 13L27 22M16 19L20 16L24 19" stroke="white" strokeWidth="2"/>
            <path d="M10 30H30" stroke="white" strokeWidth="2"/>
          </svg>
          <h1 className="text-3xl font-bold text-center text-gray-800">Request Assistance</h1>
        </div>
        <div className="max-w-2xl mx-auto bg-white rounded-lg shadow-md p-8">
          <form className="space-y-6">
            <div>
              <label htmlFor="name" className="block text-sm font-medium text-gray-700">Full Name</label>
              <Input id="name" type="text" placeholder="John Doe" required />
            </div>

            <div>
              <label htmlFor="phone" className="block text-sm font-medium text-gray-700">Phone Number</label>
              <div className="flex">
                <Select>
                  <option value="+233">+233</option>
                  {/* Add more country codes as needed */}
                </Select>
                <Input id="phone" type="tel" placeholder="123456789" className="flex-grow ml-2" required />
              </div>
            </div>

            <div>
              <label htmlFor="project-type" className="block text-sm font-medium text-gray-700">Project Type</label>
              <Select value={projectType} onValueChange={setProjectType}>
                <SelectTrigger className="w-full">
                  <SelectValue placeholder="Select a project type" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Masters Thesis">Masters Thesis</SelectItem>
                  <SelectItem value="Undergrad Project Work">Undergrad Project Work</SelectItem>
                  <SelectItem value="Data Analysis">Data Analysis</SelectItem>
                  <SelectItem value="Graphic Design">Graphic Design</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {projectType && (
              <div className="bg-blue-50 p-4 rounded-md">
                <p className="text-blue-800 font-semibold">Estimated Price: GHC {projectPrices[projectType]}</p>
              </div>
            )}

            <div>
              <label htmlFor="project-title" className="block text-sm font-medium text-gray-700">Project Title</label>
              <Input id="project-title" type="text" placeholder="Enter your project title" required />
            </div>

            <div>
              <label htmlFor="deadline" className="block text-sm font-medium text-gray-700">Deadline</label>
              <Popover>
                <PopoverTrigger asChild>
                  <Button variant="outline" className="w-full justify-start text-left font-normal">
                    <CalendarIcon className="mr-2 h-4 w-4" />
                    {date ? format(date, "PPP") : <span>Pick a date</span>}
                  </Button>
                </PopoverTrigger>
                <PopoverContent className="w-auto p-0">
                  <Calendar
                    mode="single"
                    selected={date}
                    onSelect={setDate}
                    initialFocus
                  />
                </PopoverContent>
              </Popover>
            </div>

            <div>
              <label htmlFor="institution" className="block text-sm font-medium text-gray-700">Institution Name</label>
              <Input id="institution" type="text" placeholder="Enter your institution name" required />
            </div>

            <div>
              <label htmlFor="additional-info" className="block text-sm font-medium text-gray-700">Additional Information</label>
              <Textarea id="additional-info" placeholder="Any other details you'd like to share" />
            </div>

            <Button type="submit" className="w-full bg-blue-600 hover:bg-blue-700">Submit Request</Button>
          </form>
          <div className="mt-6 text-center">
            <Link href="/" className="text-blue-600 hover:underline">
              Back to Homepage
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
