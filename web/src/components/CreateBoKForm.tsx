// components/CreateBoKForm.tsx

"use client"

import { useState } from "react"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
// import { useToast } from "@/components/ui/use-toast"
import { toast } from "sonner"


export default function CreateBoKForm() {
  const [title, setTitle] = useState("")
  const [description, setDescription] = useState("")
  const [sourceUrl, setSourceUrl] = useState("")
  const [loading, setLoading] = useState(false)
  const [urlError, setUrlError] = useState("")
//   const { toast } = useToast()

  function validateUrl(url: string): boolean {
    if (!url.trim()) return true // Empty is allowed
    
    try {
      const urlObj = new URL(url)
      return urlObj.protocol === 'http:' || urlObj.protocol === 'https:'
    } catch {
      return false
    }
  }

  function handleUrlBlur() {
    if (sourceUrl && !validateUrl(sourceUrl)) {
      setUrlError("Please enter a valid URL starting with http:// or https://")
    } else {
      setUrlError("")
    }
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    
    // Validate URL before submission
    if (sourceUrl && !validateUrl(sourceUrl)) {
      setUrlError("Please enter a valid URL starting with http:// or https://")
      return
    }
    
    setLoading(true)

    const res = await fetch("/api/bok", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title, description, source_url: sourceUrl }),
    })

    setLoading(false)

    if (res.ok) {
    //   toast({ title: "✅ BoK created successfully" })
      toast.success("✅ BoK created successfully")
      setTitle("")
      setDescription("")
      setSourceUrl("")
    } else {
    //   toast({ title: "❌ Something went wrong", variant: "destructive" })
      toast.error("❌ Something went wrong")
    }
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4 max-w-md mx-auto p-4">
      <div>
        <Label htmlFor="title">Title</Label>
        <Input
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />
      </div>

      <div>
        <Label htmlFor="description">Description</Label>
        <Input
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
      </div>

      <div>
        <Label htmlFor="sourceUrl">Source URL</Label>
        <Input
          id="sourceUrl"
          value={sourceUrl}
          onChange={(e) => setSourceUrl(e.target.value)}
          onBlur={handleUrlBlur}
          className={urlError ? "border-red-500" : ""}
        />
        {urlError && (
          <p className="text-sm text-red-500 mt-1">{urlError}</p>
        )}
      </div>

      <Button type="submit" disabled={loading || !!urlError}>
        {loading ? "Saving..." : "Create BoK"}
      </Button>
    </form>
  )
}
